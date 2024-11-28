import 'package:laza_app/constants.dart';
import 'package:laza_app/core/helper/api_service.dart';
import 'package:laza_app/features/product/domain/entites/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entites/review_entity.dart';
import '../models/product_model/product_model.dart';
import '../models/review_model/review_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProducts({required String categoryId});
  Future<ProductEntity> getProductDetails({required String productId});

  Future<List<ReviewEntity>> getReviews({required String productId});
  Future<ReviewEntity> addReview(
      {required String productId,
      required String name,
      required String feedback,
      required double rate});
  Future<List<ProductEntity>> getWishlist();
  Future<void> addWishlist(
      {required String productId,
      required String name,
      required double price,
      required String image});
  Future<void> deleteWishlist(
      {required String productId,
      required String name,
      required double price,
      required String image});
}

class ProductsRemoteDataSourceImplement implements ProductRemoteDataSource {
  final ApiService apiService;

  ProductsRemoteDataSourceImplement(this.apiService);
  @override
  Future<List<ProductEntity>> getProducts({required String categoryId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await apiService.get(
        '$baseUrl/Product/GetProductsByCategoryId?categoryId=$categoryId',
        token: token);
    final List<dynamic> data = response.data;
    List<ProductEntity> products = data.map((item) {
      final productModel = ProductModel.fromJson(item as Map<String, dynamic>);
      return productModel as ProductEntity;
    }).toList();
    return products;
  }

  @override
  Future<ProductEntity> getProductDetails({required String productId}) async {
    final response = await apiService.get(
      '$baseUrl/Product/GetProductBy/$productId',
    );
    return ProductModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<ReviewEntity>> getReviews({required String productId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      final response = await apiService
          .get('$baseUrl/Review/All-reviews/$productId', token: token);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<ReviewEntity> reviews = data.map((item) {
          final reviewModel =
              ReviewModel.fromJson(item as Map<String, dynamic>);
          return reviewModel as ReviewEntity;
        }).toList();

        return reviews;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<ReviewEntity> addReview({
    required String productId,
    required String name,
    required String feedback,
    required double rate,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService.post(
        '$baseUrl/Review/AddReview/$productId',
        {
          "Username": name,
          "Feedback": feedback,
          "Rating": rate,
        },
        token: token);

    return ReviewModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> addWishlist(
      {required String productId,
      required String name,
      required double price,
      required String image}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService.post(
        '$baseUrl/WishList/Add-WishList',
        {
          "Id": productId,
          "Name": name,
          "Price": price,
          "Img": image,
        },
        token: token);

    return response.data;
  }

  @override
  Future<void> deleteWishlist(
      {required String productId,
      required String name,
      required double price,
      required String image}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService.delete(
        '$baseUrl/WishList/RemoveFromWishList',
        {
          "Id": productId,
          "Name": name,
          "Price": price,
          "Img": image,
        },
        token: token);
    return response.data;
  }

  @override
  Future<List<ProductEntity>> getWishlist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response =
        await apiService.get('$baseUrl/WishList/GetUserWishList', token: token);
    final List<dynamic> data = response.data;
    List<ProductEntity> products = data.map((item) {
      final productModel = ProductModel.fromJson(item as Map<String, dynamic>);
      return productModel as ProductEntity;
    }).toList();
    return products;
  }
}
