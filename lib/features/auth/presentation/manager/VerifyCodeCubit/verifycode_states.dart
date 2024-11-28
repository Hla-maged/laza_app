sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeSuccess extends VerifyCodeState {}

final class VerifyCodeFailure extends VerifyCodeState {
  final String error;
  VerifyCodeFailure(this.error);
}
