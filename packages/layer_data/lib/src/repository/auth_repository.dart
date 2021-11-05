import '/src/datasource/remote_data_source.dart';

import 'package:layer_domain/layer_domain.dart';

class AuthRepository implements IAuthRepository {
  final IRemoteDataSource remoteDataSource;

  AuthRepository({
    required this.remoteDataSource,
  });

  @override
  Future<bool> login({required String username, required String password}) =>
      remoteDataSource.login(username: username, password: password);

  @override
  void logout() => remoteDataSource.logout();

  @override
  bool isLogined() => remoteDataSource.token != null;
}
