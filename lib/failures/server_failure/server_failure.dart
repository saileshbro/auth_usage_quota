import 'dart:io';

import 'package:auth_usage_quota/failures/failure.dart';

class ServerFailure extends Failure {
  const ServerFailure({
    required this.message,
    this.statusCode = HttpStatus.internalServerError,
  });
  @override
  final String message;
  @override
  final int statusCode;
}
