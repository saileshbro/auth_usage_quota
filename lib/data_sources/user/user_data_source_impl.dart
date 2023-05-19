import 'package:auth_usage_quota/data_sources/user/user_data_source.dart';
import 'package:auth_usage_quota/db_client/cloud_firestore_client.dart';
import 'package:auth_usage_quota/db_client/db_constants.dart';
import 'package:auth_usage_quota/exceptions/http_exception/not_found_exception.dart';
import 'package:auth_usage_quota/exceptions/server_exception/server_exception.dart';
import 'package:auth_usage_quota/models/user/user.dart';
import 'package:grpc/grpc.dart';

final class UserDataSourceImpl with DBConstants implements UserDataSource {
  UserDataSourceImpl(this.dbClient);
  final CloudFirestoreClient dbClient;

  @override
  Future<User> getUserById(String id) async {
    try {
      final user = await dbClient.getById(DBConstants.usersColxnName, id);
      if (user == null) throw const NotFoundException();
      return User.fromJson(user.data);
    } on GrpcError catch (e) {
      throw ServerException(e.message ?? 'Server Error');
    } on NotFoundException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    try {
      await dbClient.update(
        DBConstants.usersColxnName,
        DbEntityRecord(id: id, data: data),
      );
      return;
    } on GrpcError catch (e) {
      throw ServerException(e.message ?? 'Server Error');
    } on NotFoundException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
