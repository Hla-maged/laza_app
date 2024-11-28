import '../../../domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({
    required super.productId,
    required super.productName,
    required super.productPrice,
    required super.productImage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      productId: json['Id'] as String? ?? '',
      productName: json['Name'] as String? ?? '',
      productPrice: (json['Price'] as num?)?.toDouble() ?? 0.0,
      productImage: json['Img'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': productId,
      'Name': productName,
      'Price': productPrice,
      'Image': productImage,
    };
  }
}
