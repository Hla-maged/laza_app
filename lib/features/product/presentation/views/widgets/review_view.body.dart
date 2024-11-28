import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/helper/widgets/loading_indicator.dart';
import '../../../../home/presentation/views/widgets/custom_app_bar.dart';
import '../../manager/ProductsCubit/products_cubit.dart';
import '../add_review_view.dart';
import 'review_card.dart';

class ReviewViewbody extends StatelessWidget {
  const ReviewViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return Padding(
        padding: const EdgeInsets.only(top: 60, right: 15, left: 15),
        child: Column(children: [
          const CustomAppBar(
            title: 'Reviews',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  final shouldReload = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddReviewView(),
                      settings: RouteSettings(arguments: id),
                    ),
                  );
                  if (shouldReload == true) {
                    BlocProvider.of<ProductsCubit>(context)
                        .fetchReviews(productId: id);
                  }
                },
                child: Container(
                  height: 35,
                  width: 115,
                  decoration: BoxDecoration(
                      color: const Color(0xffFF7043),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.edit_note,
                        color: Colors.white,
                      ),
                      Text(
                        'Add Review',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
            if (state is ReviewsSuccess) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.reviews.length} Reviews',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              const Text('4.6'),
                              RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ReviewCard(
                            name: state.reviews[index].name,
                            desc: state.reviews[index].feedback,
                            rate: state.reviews[index].rating,
                          ),
                        );
                      })
                ],
              );
            } else if (state is ReviewsEmpty) {
              return const Padding(
                padding: EdgeInsets.all(30),
                child: Center(child: Text('There is no reviews yet!')),
              );
            } else if (state is ReviewsFailure) {
              return Text(state.error);
            } else {
              return const CustomLoadingIndicator();
            }
          })
        ]));
  }
}
