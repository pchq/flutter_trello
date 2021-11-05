// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:layer_data/layer_data.dart';

void main() {
  Dio dio = Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };
  RemoteDataSource remoteDataSource = RemoteDataSource(dio: dio);

  test('auth', () async {
    var data = await remoteDataSource.login(username: 'armada', password: 'FSH6zBZ0p9yH');

    print(data);
    print(remoteDataSource.token);
  });
  test('get cards', () async {
    print(remoteDataSource.token);
    var data = await remoteDataSource.loadCards();

    print(data);
  });
}
