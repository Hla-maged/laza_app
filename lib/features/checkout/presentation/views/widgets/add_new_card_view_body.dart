import 'package:flutter/material.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'card_choice.dart';
import 'add_card_info.dart';

class AddNewCardViewBody extends StatelessWidget {
  const AddNewCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: 'Add New card',
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardChoice(icon: Icons.credit_card, color: Colors.orange),
                    CardChoice(icon: Icons.paypal, color: Colors.blue),
                    CardChoice(
                        icon: Icons.account_balance, color: Colors.black),
                  ],
                ),
                SizedBox(height: 20),
                AddCardInfo(
                  text: 'Add Card',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
