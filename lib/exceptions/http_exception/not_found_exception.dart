import 'dart:io';

import 'package:auth_usage_quota/exceptions/http_exception/custom_http_exception.dart';

final class NotFoundException extends CustomHttpException {
  const NotFoundException({
    super.message = 'Not Found',
    super.statusCode = HttpStatus.notFound,
  });
}
