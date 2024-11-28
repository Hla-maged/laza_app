import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../core/helper/api_service.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../models/cart_item_model/cart_item_model.dart';

abstract class CartRemoteDataSource {
  Future<CartEntity> getCart();
  Future<void> addCart({required String productId});
  Future<void> deleteCart({required String productId});
  Future<void> deleteAllCart();
}

class CartRemoteDataSourceImplement extends CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImplement(this.apiService);

  @override
  Future<CartEntity> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await apiService.get(
      '$baseUrl/Cart/GetCart',
      token: token,
    );
    if (response.data is Map<String, dynamic>) {
      final Map<String, dynamic> data = response.data;
      print('data $data');
    final String? id = data['Id'] as String?;
    final String? userId = data['UserId'] as String?;
    final double totalPrice = (data['TotalPrice'] as num?)?.toDouble() ?? 0.0;
  
      final List<dynamic> items = data['Items'] ?? [];
      List<CartItemEntity> products = items.map((item) {
        return CartItemModel.fromJson(item as Map<String, dynamic>);
      }).toList();
      print('products $products');
      final CartEntity cart = CartEntity(
        id: id ?? '',
      userId: userId ?? '', 
      totalPrice: totalPrice,
      items: products,
      );
      return cart;
    } else {
      throw Exception('Invalid response format');
    }
  }

  Future<void> addCart({required String productId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response =
        await apiService.post('$baseUrl/Cart/AddToCart', token: token, {
      "ProductId": productId,
      "ProductName": "",
      "ProductImg": "",
      "Price": 0,
      "Quantity": 0,
    });
    print('response ${response.data}');
    return response.data;
  }

  @override
  Future<void> deleteCart({required String productId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService
        .delete('$baseUrl/Cart/Remove-items/$productId', {}, token: token);
    print(response.data);
    return response.data;
  }

  @override
  Future<void> deleteAllCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response =
        await apiService.delete('$baseUrl/Cart/Clear-Cart', {}, token: token);
    print(response.data);
    return response.data;
  }
}
