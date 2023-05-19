import 'dart:io';

import 'package:auth_usage_quota/exceptions/http_exception/unauthorized_exception.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:auth_usage_quota/repositories/user/user_repository.dart';
import 'package:auth_usage_quota/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';

Handler authorizationMiddleware(Handler handler) {
  return (context) async {
    try {
      final request = context.request;
      final authHeader = request.headers[HttpHeaders.authorizationHeader] ?? '';
      final token = authHeader.replaceFirst('Bearer ', '');
      if (token.isEmpty) throw const UnauthorizedException();
      final jwtService = context.read<JWTService>();
      final decodedUser = jwtService.decode(token);
      late final String userId;
      switch (decodedUser) {
        case {'user_id': final String id} when id.isNotEmpty:
          userId = id;
        default:
          throw const UnauthorizedException();
      }
      final userRepository = context.read<UserRepository>();
      final user = await userRepository.getUserById(userId);
      if (user.isLeft) throw const UnauthorizedException();
      context = context.provide<User>(() => user.right);
      return handler(context);
    } on UnauthorizedException catch (e) {
      return e.response;
    }
  };
}
