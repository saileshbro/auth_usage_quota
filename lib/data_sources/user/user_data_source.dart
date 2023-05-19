import 'package:auth_usage_quota/models/user/user.dart';

abstract interface class UserDataSource {
  Future<User> getUserById(String id);
  Future<void> updateUser(String id, Map<String, dynamic> data);
}
