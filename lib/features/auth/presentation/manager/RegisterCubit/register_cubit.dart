import 'package:bloc/bloc.dart';
import '../../../data/models/auth_response.dart';
import '../../../domain/usecases/register_usecase.dart';
part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> register(
      String name, String email, String password, bool remember) async {
    emit(RegisterInitial());

    try {
      var result = await registerUseCase.call(
          name: name, email: email, password: password, remember: remember);
      emit(RegisterSuccess(result));
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }
}
