import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import '../../manager/AddressCubit/address_cubit.dart';
import 'input_text_feild.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, country, city, address, phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Address',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                    InputTextFeild(
                      title: 'your name',
                      onSaved: (val) {
                        name = val;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Country',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              InputTextFeild(
                                title: 'your country',
                                onSaved: (val) {
                                  country = val;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'City',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              InputTextFeild(
                                title: 'your city',
                                onSaved: (val) {
                                  city = val;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                    InputTextFeild(
                      title: 'your phone number',
                      onSaved: (val) {
                        phone = val;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                    InputTextFeild(
                      title: 'your address',
                      onSaved: (val) {
                        address = val;
                      },
                    ),
                    const SizedBox(
                      height: 159,
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'Save Address',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    BlocProvider.of<AddressCubit>(context).addAddress(
                        name: name!,
                        country: country!,
                        city: city!,
                        address: address!,
                        phone: phone!);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
