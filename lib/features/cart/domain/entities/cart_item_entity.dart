class CartItemEntity {
  final String id, name, img;
  final double price;
  final int quantity;

  CartItemEntity(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.quantity});
}
