import '../../../domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  String? productId;
  String? productName;
  String? productImg;
  double? productPrice;
  int? productQuantity;

  CartItemModel({
    this.productId,
    this.productName,
    this.productImg,
    this.productPrice,
    this.productQuantity,
  }) : super(
            id: productId!,
            name: productName!,
            img: productImg!,
            price: productPrice!,
            quantity: productQuantity!);

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        productId: json['ProductId'] as String?,
        productName: json['ProductName'] as String?,
        productImg: json['ProductImg'] as String?,
        productPrice: (json['Price'] as num?)?.toDouble(),
        productQuantity: json['Quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ProductId': productId,
        'ProductName': productName,
        'ProductImg': productImg,
        'Price': price,
        'Quantity': quantity,
      };
}
