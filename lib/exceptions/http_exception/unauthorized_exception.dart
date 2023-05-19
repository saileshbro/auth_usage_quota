import 'dart:io';

import 'package:auth_usage_quota/exceptions/http_exception/custom_http_exception.dart';

final class UnauthorizedException extends CustomHttpException {
  const UnauthorizedException({
    super.message = 'Unauthorized',
    super.statusCode = HttpStatus.unauthorized,
  });
}
