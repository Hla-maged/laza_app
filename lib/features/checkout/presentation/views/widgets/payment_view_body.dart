import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';

import '../../../../../constants.dart';
import 'get_card_info.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const CustomAppBar(
                  title: 'Payment',
                ),
                const SizedBox(height: 50),
                Image.asset('assets/images/Screenshot 2024-10-03 232340.png'),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'addNewCard'),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: kPrimaryColor)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box_outlined,
                          color: kPrimaryColor,
                        ),
                        Text(
                          'Add New Card',
                          style: TextStyle(color: kPrimaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const GetCardInfo(text: 'Save Card'),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
