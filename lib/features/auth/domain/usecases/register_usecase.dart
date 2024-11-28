import '../../data/models/auth_response.dart';
import '../repos/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<AuthResponse> call({
    required String name,
    required String email,
    required bool remember,
    required String password,
  }) async {
    return await authRepo.register(
        name: name, email: email, password: password, remember: remember);
  }
}
