import '../repos/auth_repo.dart';

class ForgetPassUseCase {
  final AuthRepo authRepo;

  ForgetPassUseCase({required this.authRepo});
  Future<void> call({required String email}) async {
    return await authRepo.forgetPass(email: email);
  }
}
