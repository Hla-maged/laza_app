

import 'order_item_entity.dart';

class OrderEntity {
  final String id;
  final String userId;
  final double totalPrice;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.items,
  });
}
