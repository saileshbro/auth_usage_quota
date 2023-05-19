import 'package:auth_usage_quota/data_sources/user/user_data_source.dart';
import 'package:auth_usage_quota/repositories/user/user_repository.dart';
import 'package:auth_usage_quota/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';

import '../main.dart';

// This is the middleware that will be used for all routes.
Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<JWTService>((_) => jwtService))
      .use(provider<UserRepository>((_) => userRepository))
      .use(provider<UserDataSource>((_) => userDataSource));
}
