import 'package:auth_usage_quota/exceptions/http_exception/bad_request_exception.dart';
import 'package:auth_usage_quota/exceptions/http_exception/not_allowed_exception.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:auth_usage_quota/repositories/user/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return const NotAllowedException().response;
  }

  final body = await context.request.json();
  late String code;
  switch (body) {
    case {'code': final String val} when val.isNotEmpty:
      code = val;
    default:
      return const BadRequestException().response;
  }
  final user = context.read<User>();
  final tokensRequired = _calculateTokensRequired(code);
  if (user.quota < tokensRequired) {
    return const BadRequestException(message: 'Quota exceeded').response;
  }
  final updatedQuota = user.quota - tokensRequired;
  await context
      .read<UserRepository>()
      .updateUser(user.id, {'quota': updatedQuota});

  return Response.json(
    body: {
      ...user.toJson(),
      'remaining_quota': updatedQuota,
      'request_body': body,
    },
  );
}

int _calculateTokensRequired(String code) => code.length;
