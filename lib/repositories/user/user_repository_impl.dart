import 'package:auth_usage_quota/data_sources/user/user_data_source.dart';
import 'package:auth_usage_quota/failures/failure.dart';
import 'package:auth_usage_quota/failures/server_failure/server_failure.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:auth_usage_quota/repositories/user/user_repository.dart';
import 'package:either_dart/either.dart';

final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userDataSource);
  final UserDataSource userDataSource;

  @override
  Future<Either<Failure, User>> getUserById(String userId) async {
    try {
      final user = await userDataSource.getUserById(userId);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(
    String userId,
    Map<String, dynamic> data,
  ) async {
    try {
      final user = await userDataSource.updateUser(userId, data);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
