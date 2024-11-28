import 'package:bloc/bloc.dart';
import 'package:laza_app/features/auth/data/models/auth_response.dart';
import '../../../domain/usecases/login_usecase.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login(String email, String password, bool remember) async {
    emit(LoginInitial());

    try {
      var result = await loginUseCase.call(
          email: email, password: password, remember: remember);
      emit(LoginSuccess(result));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
