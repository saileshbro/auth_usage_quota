import 'dart:io';

import 'package:auth_usage_quota/exceptions/http_exception/custom_http_exception.dart';

final class NotAllowedException extends CustomHttpException {
  const NotAllowedException({
    super.message = 'Not Allowed',
    super.statusCode = HttpStatus.methodNotAllowed,
  });
}
