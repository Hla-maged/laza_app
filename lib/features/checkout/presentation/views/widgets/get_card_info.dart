import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/checkout/presentation/manager/PaymentCubit/payment_cubit.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import 'input_text_feild.dart';

class GetCardInfo extends StatelessWidget {
  const GetCardInfo({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        if (state is GetPaymentSuccess) {
          final card = state.cards[0];
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Card Owner',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ],
                      ),
                      InputTextFeild(
                        title: card.name,
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
                        title: card.number,
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                                InputTextFeild(
                                  title: card.date,
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                                InputTextFeild(
                                  title: card.cVV,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 170,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: text,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'cart');
                  },
                )
              ],
            ),
          );
        } else if (state is PaymentFailure) {
          return (Text(state.error));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
