import '../../data/models/product_model/image.dart';
import '../../data/models/review_model/review_model.dart';

class ProductEntity {
  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;
  final String? productDesc;
  final List<Image>? images;
  final List<ReviewModel>? reviews;
  ProductEntity({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.images,
    this.productDesc,
    this.reviews,
  });
}
