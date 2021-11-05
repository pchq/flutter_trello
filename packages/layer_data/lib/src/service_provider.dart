import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:layer_domain/layer_domain.dart';

import '/src/repository/auth_repository.dart';
import '/src/repository/cards_repository.dart';
import '/src/datasource/remote_data_source.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final I = ServiceProvider();

  void init() {
    _getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(remoteDataSource: _getIt()),
    );
    _getIt.registerLazySingleton<ICardsRepository>(
      () => CardsRepository(remoteDataSource: _getIt()),
    );

    _getIt.registerLazySingleton<IRemoteDataSource>(
      () => RemoteDataSource(dio: _getIt()),
    );

    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _getIt.registerLazySingleton<Dio>(
      () => dio,
    );
  }
}
