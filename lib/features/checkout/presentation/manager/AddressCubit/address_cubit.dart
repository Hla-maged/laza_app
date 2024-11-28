import 'package:bloc/bloc.dart';
import 'package:laza_app/features/checkout/domain/usecases/add_address_usecase.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddAddressUsecase? addAddressUsecase;
  AddressCubit([this.addAddressUsecase]) : super(AddressLoading());
  Future<void> addAddress(
      {required String name,
      required String country,
      required String city,
      required String address,
      required String phone}) async {
    var result = await addAddressUsecase!.call(AddAddressParams(
        address: address,
        name: name,
        city: city,
        phone: phone,
        country: country));
    result.fold((failure) {
      print(failure.errMessage);
      emit(AddressFailure(failure.errMessage));
    }, (_) async {
      print('add address cubit success');
      emit(AddressSuccess());
    });
  }
}
