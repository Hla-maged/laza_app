import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/auth/domain/usecases/updatepass_usecase.dart';
part 'updatePass_states.dart';

class UpdatepassCubit extends Cubit<UpdatePassState> {
  UpdatepassCubit(this.updatepassUscase) : super(UpdatePassInitial());
  final UpdatepassUsecase updatepassUscase;

  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    emit(UpdatePassLoading());
    try {
      await updatepassUscase.call(
          pass: pass, confirmPass: confirmPass, email: email);
      emit(UpdatePassSuccess());
    } catch (e) {
      emit(UpdatePassFailure(e.toString()));
    }
  }
}
