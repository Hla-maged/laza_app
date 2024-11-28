import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/checkout/presentation/manager/PaymentCubit/payment_cubit.dart';

import '../../../../auth/presentation/views/widgets/custom_button.dart';
import 'input_text_feild.dart';

class AddCardInfo extends StatefulWidget {
  const AddCardInfo({super.key, required this.text});
  final String text;

  @override
  State<AddCardInfo> createState() => _AddCardInfoState();
}

class _AddCardInfoState extends State<AddCardInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, number, cvv, date;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Card Owner',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ],
                  ),
                  InputTextFeild(
                    title: 'Your Name',
                    onSaved: (val) {
                      name = val;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Card Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ],
                  ),
                  InputTextFeild(
                    title: 'Your Card Number',
                    onSaved: (val) {
                      number = val;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('EXP',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                            InputTextFeild(
                              title: 'Your EXP',
                              onSaved: (val) {
                                date = val;
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
                            const Text('CVV',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                            InputTextFeild(
                              title: 'Your CVV',
                              onSaved: (val) {
                                cvv = val;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            CustomButton(
              text: widget.text,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  await BlocProvider.of<PaymentCubit>(context).addPayment(
                    cardName: name!,
                    cardNumber: number!,
                    cvv: cvv!,
                    date: date!,
                  );
                  await BlocProvider.of<PaymentCubit>(context).getPayment();
                  Navigator.pushNamed(context, 'payment');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
