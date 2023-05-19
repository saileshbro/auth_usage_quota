import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

base class CustomHttpException extends HttpException {
  const CustomHttpException({
    required String message,
    required this.statusCode,
  }) : super(message);

  final int statusCode;
  Map<String, dynamic> get _json =>
      {'error': message, 'status_code': statusCode};
  Response get response => Response.json(statusCode: statusCode, body: _json);
}
