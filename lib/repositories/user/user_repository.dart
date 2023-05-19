import 'package:auth_usage_quota/failures/failure.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:either_dart/either.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> getUserById(String userId);
  Future<Either<Failure, void>> updateUser(
    String userId,
    Map<String, dynamic> data,
  );
}
