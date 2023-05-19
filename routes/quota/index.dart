import 'package:auth_usage_quota/exceptions/http_exception/not_allowed_exception.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return const NotAllowedException().response;
  }
  final user = context.read<User>();
  return Response.json(
    body: {
      'remaining_quota': user.quota,
    },
  );
}
