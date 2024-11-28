import '../../data/models/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login(
      {required String email,
      required String password,
      required bool remember});
  Future<AuthResponse> register({
    required String name,
    required String email,
    required bool remember,
    required String password,
  });
  Future<void> forgetPass({required String email});
  Future<void> verify({
    required String code,
    required String email,
  });
  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email});
}
