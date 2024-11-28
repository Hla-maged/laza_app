import '../../../domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  String? productId;
  String? productName;
  String? productImg;
  double? productPrice;
  int? productQuantity;

 OrderItemModel({
    this.productId,
    this.productName,
    this.productImg,
    this.productPrice,
    this.productQuantity,
  }) : super(id: productId!, name: productName!, img: productImg!, price: productPrice!, quantity: productQuantity!);

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
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
        'Price': productPrice,
        'Quantity': productQuantity,
      };
}
