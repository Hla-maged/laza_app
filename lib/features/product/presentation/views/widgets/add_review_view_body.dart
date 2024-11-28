import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:laza_app/features/product/presentation/manager/ProductsCubit/products_cubit.dart';

import '../../../../auth/presentation/views/widgets/custom_button.dart';
import 'rating_slider.dart';

class AddReviewViewBody extends StatefulWidget {
  const AddReviewViewBody({super.key});

  @override
  State<AddReviewViewBody> createState() => _AddReviewViewBodyState();
}

class _AddReviewViewBodyState extends State<AddReviewViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  String? name, feedback;
  double? rate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, right: 15, left: 15),
            child: Form(
              key: formKey,
              autovalidateMode: validateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    title: 'Add Review',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      name = val;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[70],
                        hintText: 'Type your name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'How was your experience ?',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      feedback = val;
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your feedback';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[70],
                      hintText: 'Describe your experience?',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                    maxLines: 8,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Star',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('0.0'),
                      RatingSlider(
                        onChanged: (val) {
                          setState(() {
                            rate = val;
                          });
                        },
                      ),
                      const Text('5.0'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          CustomButton(
            text: 'Submit Review',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final id = ModalRoute.of(context)?.settings.arguments as String;
                print('onTap called, attempting to add review...');
                BlocProvider.of<ProductsCubit>(context)
                    .addReview(
                        productId: id,
                        name: name!,
                        feedback: feedback!,
                        rate: rate!)
                    .then((_) {
                  Navigator.pop(context, true);
                });
              }
            },
          )
        ],
      ),
    );
  }
}
