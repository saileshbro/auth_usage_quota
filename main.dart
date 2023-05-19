import 'dart:io';

import 'package:auth_usage_quota/data_sources/user/user_data_source.dart';
import 'package:auth_usage_quota/data_sources/user/user_data_source_impl.dart';
import 'package:auth_usage_quota/db_client/cloud_firestore_client.dart';
import 'package:auth_usage_quota/repositories/user/user_repository.dart';
import 'package:auth_usage_quota/repositories/user/user_repository_impl.dart';
import 'package:auth_usage_quota/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';

late File serviceAccount;
const jwtService = JWTService();
late CloudFirestoreClient firestoreClient;
late UserDataSource userDataSource;
late UserRepository userRepository;

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  serviceAccount = File('service-account.json');
  firestoreClient = CloudFirestoreClient.initialize(serviceAccount);
  userDataSource = UserDataSourceImpl(firestoreClient);
  userRepository = UserRepositoryImpl(userDataSource);
  return serve(handler, ip, port);
}
