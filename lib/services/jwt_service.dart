import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JWTService {
  const JWTService();
  Map<String, dynamic> decode(String token) {
    final jwt = JWT.tryDecode(token);
    if (jwt == null) return {};
    return jwt.payload as Map<String, dynamic>? ?? {};
  }
}
