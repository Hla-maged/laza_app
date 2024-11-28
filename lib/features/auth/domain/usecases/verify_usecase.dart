import '../repos/auth_repo.dart';

class VerifyUseCase {
  final AuthRepo authRepo;

  VerifyUseCase({required this.authRepo});

  Future<void> call({required String code, required String email}) {
    return authRepo.verify(code: code, email: email);
  }
}
