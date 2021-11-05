abstract class IAuthRepository {
  bool isLogined();
  Future<bool> login({required String username, required String password});
  void logout();
}
