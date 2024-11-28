import 'package:laza_app/features/cart/data/models/cart_item_model/cart_item_model.dart';

class CartModel {
  String? id;
  String? userId;
  double? totalPrice;
  List<CartItemModel>? items;

  CartModel({this.id, this.userId, this.totalPrice, this.items});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['Id'] as String? ??'',
        userId: json['UserId'] as String? ??'',
        totalPrice: (json['TotalPrice'] as num?)?.toDouble() ??0.0,
        items: (json['Items'] as List<dynamic>)
            .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'UserId': userId,
        'TotalPrice': totalPrice,
        'Items': items?.map((e) => e.toJson()).toList(),
      };
}
