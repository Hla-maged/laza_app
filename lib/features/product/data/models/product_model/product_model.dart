import 'package:laza_app/features/product/domain/entites/product_entity.dart';

import '../review_model/review_model.dart';
import 'image.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.productId,
      required super.productName,
      required super.productPrice,
      required super.productImage,
      super.productDesc,
      super.images,
      super.reviews});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['Id'] as String? ?? '',
      productName: json['Name'] as String? ?? '',
      productPrice: (json['Price'] as num?)?.toDouble() ?? 0.0,
      productImage: json['Img'] as String? ?? '',
      productDesc: json['Description'] as String? ?? '',
      //  categoryId: json['CategoryId'] as String?,
      images: (json['Images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['Reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'Id': productId,
        'Name': productName,
        'Price': productPrice,
        'Description': productDesc,
        // 'CategoryId': categoryId,
        'Img': productImage,
        'Images': images?.map((e) => e.toJson()).toList(),
        'Reviews': reviews?.map((e) => e.toJson()).toList() ?? [],
      };
}
