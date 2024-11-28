import 'order_item_model.dart';

class OrderModel {
  String? id;
  String? userId;
  int? totalPrice;
  List<OrderItemModel>? items;

  OrderModel({this.id, this.userId, this.totalPrice, this.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['Id'] as String?,
        userId: json['UserId'] as String?,
        totalPrice: json['TotalPrice'] as int?,
        items: (json['Items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'UserId': userId,
        'TotalPrice': totalPrice,
        'Items': items?.map((e) => e.toJson()).toList(),
      };
}
