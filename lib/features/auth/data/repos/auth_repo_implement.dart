import 'package:laza_app/core/helper/api_service.dart';
import 'package:laza_app/features/auth/data/models/auth_response.dart';
import 'package:laza_app/features/auth/domain/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiService apiService;

  AuthRepoImplement({required this.apiService});

  @override
  Future<AuthResponse> login(
      {required String email,
      required String password,
      required bool remember}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/Login',
      {'Email': email, 'Password': password, "RememberMe": remember},
    );

    final token = response.data['Token'] ?? '';
    await storeToken(token);
    return AuthResponse(token: token);
  }

  @override
  Future<AuthResponse> register(
      {required String name,
      required String email,
      required String password,
      required bool remember}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/Register',
      {
        'Name': name,
        'Email': email,
        'Password': password,
        "RememberMe": remember
      },
    );
    final token = response.data['Token'] ?? '';

    await storeToken(token);
    return AuthResponse(token: token);
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefrence = await SharedPreferences.getInstance();
    await prefrence.setString('token', token);
    await prefrence.setBool('loggedIn', true);
  }

  @override
  Future<void> forgetPass({required String email}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/reset-password',
      {
        'Email': email,
      },
    );
    print('response:${response.data}');
    return response.data;
  }

  @override
  Future<void> verify({required String code, required String email}) {
    final response = apiService.post('$baseUrl/Auth/verify-code', {
      'code': code,
      'email': email,
    });
    return response;
  }

  @override
  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email}) {
    final response = apiService.post('$baseUrl/Auth/update-password', {
      'NewPassword': pass,
      'ConfirmPassword': confirmPass,
      'Email': email,
    });
    return response;
  }
}
