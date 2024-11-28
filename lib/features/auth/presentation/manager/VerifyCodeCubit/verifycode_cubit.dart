import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/VerifyCodeCubit/verifycode_states.dart';

import '../../../domain/usecases/verify_usecase.dart';

class VerifycodeCubit extends Cubit<VerifyCodeState> {
  VerifycodeCubit(this.verifyUseCase) : super(VerifyCodeInitial());
  final VerifyUseCase verifyUseCase;

  Future<void> verify({required String code, required String email}) async {
    emit(VerifyCodeLoading());
    try {
      await verifyUseCase.call(code: code, email: email);
      emit(VerifyCodeSuccess());
    } catch (e) {
      emit(VerifyCodeFailure('Failed to Verify Code:${e.toString()}'));
    }
  }
}
