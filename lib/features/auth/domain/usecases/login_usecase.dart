import 'package:laza_app/features/auth/data/models/auth_response.dart';

import '../repos/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<AuthResponse> call(
      {required String email,
      required String password,
      required bool remember}) async {
    return await authRepo.login(
        email: email, password: password, remember: remember);
  }
}
