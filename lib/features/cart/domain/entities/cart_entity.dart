import 'cart_item_entity.dart';

class CartEntity {
  final String id;
  final String userId;
  final double totalPrice;
  final List<CartItemEntity> items;

  CartEntity({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.items,
  });
}
