import 'package:bloc/bloc.dart';
import 'package:laza_app/features/checkout/domain/entities/card_entity.dart';
import '../../../domain/usecases/add_payment_usecase.dart';
import '../../../domain/usecases/get_payment_usecase.dart';
import '../../../domain/usecases/order_confirm_usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final AddPaymentUsecase? addPaymentUsecase;
  final GetPaymentUseCase? getPaymentUsecase;
  final OrderConfirmUsecase? orderConfirmUsecase;
  PaymentCubit(
      [this.addPaymentUsecase,
      this.getPaymentUsecase,
      this.orderConfirmUsecase])
      : super(PaymentLoading());
  Future<void> addPayment({
    required String cardName,
    required String cardNumber,
    required String cvv,
    required String date,
  }) async {
    var result = await addPaymentUsecase!.call(AddPaymentParams(
        cardName: cardName, cvv: cvv, cardNumber: cardNumber, date: date));
    result.fold((failure) {
      emit(PaymentFailure(failure.errMessage));
    }, (_) async {
      print('add payment cubit success');
      emit(PaymentSuccess());
    });
  }

  Future<void> getPayment() async {
    var result = await getPaymentUsecase!.call();
    result.fold((failure) {
      emit(PaymentFailure(failure.errMessage));
    }, (cards) async {
      print('get payment cubit success');
      emit(GetPaymentSuccess(cards));
    });
  }


}
