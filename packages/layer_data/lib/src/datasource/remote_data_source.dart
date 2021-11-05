import 'package:dio/dio.dart';
import 'package:module_models/module_models.dart';

abstract class IRemoteDataSource {
  String? get token;
  Future<List<BoardCard>> loadCards();
  Future<bool> login({required String username, required String password});
  void logout();
  Future<bool> refreshToken();
}

class RemoteDataSource implements IRemoteDataSource {
  final Dio dio;

  RemoteDataSource({
    required this.dio,
  });

  String? _token;

  @override
  String? get token => _token;

  @override
  Future<List<BoardCard>> loadCards() async {
    try {
      final Response response = await dio.get(
        'https://trello.backend.tests.nekidaem.ru/api/v1/cards/',
        options: Options(
          headers: {'Authorization': 'JWT $_token'},
        ),
      );

      return (response.data as List).map((e) => BoardCard.fromJson(e)).toList();
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data);
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  Future<bool> login({required String username, required String password}) async {
    try {
      final Response response = await dio.post(
        'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/',
        data: {'username': username, 'password': password},
      );
      _token = (response.data as Map)['token'];

      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data);
      } else {
        throw Exception(e.message);
      }
    }
  }

  @override
  void logout() {
    _token = null;
  }

  @override
  Future<bool> refreshToken() async {
    try {
      final Response response = await dio.post(
        'https://trello.backend.tests.nekidaem.ru/api/v1/users/refresh_token/',
        data: {
          'token': token,
        },
      );
      _token = (response.data as Map)['token'];

      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data);
      } else {
        throw Exception(e.message);
      }
    }
  }
}
