import 'package:auth_usage_quota/middlewares/authorization_middleware.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) => authorizationMiddleware(handler);
