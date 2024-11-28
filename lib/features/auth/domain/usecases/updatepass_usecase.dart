import 'package:laza_app/features/auth/domain/repos/auth_repo.dart';

class UpdatepassUsecase {
  final AuthRepo authRepo;

  UpdatepassUsecase({required this.authRepo});

  Future<void> call(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    return await authRepo.updatePass(
        pass: pass, confirmPass: confirmPass, email: email);
  }
}
