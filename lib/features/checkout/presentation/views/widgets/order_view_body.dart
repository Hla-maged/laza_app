import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/checkout/presentation/manager/OrderCubit/order_cubit.dart';
import 'package:laza_app/features/home/presentation/views/widgets/custom_category_app_bar.dart';

import '../../../../../core/helper/widgets/loading_indicator.dart';
import 'empty_orders.dart';
import 'order_item.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const CustomCategoryAppBar(title: 'Orders'),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderSuccess) {
                  final orders = state.orders;
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                             print('id: ${order.id}');
                            return Card(
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Order Total:',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${order.totalPrice} EGP',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.grey),
                                          onPressed: () async {
                                            final confirm =
                                                await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title:
                                                    const Text('Cancel Order'),
                                                content: const Text(
                                                    'Are you sure you want to delete this order?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, false);
                                                      BlocProvider.of<
                                                                  OrderCubit>(
                                                              context)
                                                          .deleteOrder(
                                                              orderId:
                                                                  order.id);
                                                    },
                                                    child: const Text('Delete'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, true),
                                                    child: const Text('Exit'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          
                                            print(confirm);
                                            if (confirm ?? false) {
                                              await BlocProvider.of<OrderCubit>(
                                                      context)
                                                  .deleteOrder(
                                                      orderId: order.id);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Products:',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: order.items.length,
                                      itemBuilder: (context, itemIndex) {
                                        final product = order.items[itemIndex];
                                        return OrderItem(
                                          name: product.name,
                                          image: product.img,
                                          price: product.price,
                                          quantity: product.quantity,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
                } else if (state is OrderEmpty) {
                  return const EmptyOrders();
                } else if (state is OrderFailure) {
                  return Center(
                    child: Text('Error: ${state.error}'),
                  );
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
