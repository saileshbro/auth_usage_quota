import 'dart:io';

import 'package:auth_usage_quota/exceptions/http_exception/custom_http_exception.dart';

final class BadRequestException extends CustomHttpException {
  const BadRequestException({
    super.message = 'Bad Request',
    super.statusCode = HttpStatus.badRequest,
  });
}
