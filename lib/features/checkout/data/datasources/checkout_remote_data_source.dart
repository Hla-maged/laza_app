import 'package:laza_app/core/helper/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../models/card_model.dart';
import '../models/order_model/order_item_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<void> addAddress({
    required String name,
    required String country,
    required String city,
    required String address,
    required String phone,
  });
  Future<void> addPayment({
    required String cardName,
    required String cardNumber,
    required String date,
    required String cvv,
  });
  Future<List<CardEntity>> getPayment();
  Future<List<OrderEntity>> getOrders();
  Future<void> deleteOrder({required String orderId});
  Future<void> orderConfirm();
}

class CheckoutRemoteDataSourceImplement extends CheckoutRemoteDataSource {
  final ApiService apiService;

  CheckoutRemoteDataSourceImplement(this.apiService);
  @override
  Future<void> addAddress({
    required String name,
    required String country,
    required String city,
    required String address,
    required String phone,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response =
        await apiService.post('$baseUrl/Card/Add-Address', token: token, {
      "UserName": name,
      "Address": address,
      "City": city,
      "Country": country,
      "Phone": phone,
    });
    print(response.data);
    return response.data;
  }

  @override
  Future<void> addPayment({
    required String cardName,
    required String cardNumber,
    required String date,
    required String cvv,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response =
        await apiService.post('$baseUrl/Card/AddNewCard', token: token, {
      "CardOwner": cardName,
      "CardNumber": cardNumber,
      "ExpirationDate": date,
      "CVV": cvv,
    });
    print('response ${response.data}');
    return response.data;
  }

  @override
  Future<List<CardEntity>> getPayment() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response =
        await apiService.get('$baseUrl/Card/GetCard', token: token);
    final List<dynamic> data = response.data;
    List<CardEntity> cards = data.map((item) {
      final cardModel = CardModel.fromJson(item as Map<String, dynamic>);
      return cardModel as CardEntity;
    }).toList();
    return cards;
  }

  @override
  Future<void> orderConfirm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService
        .post('$baseUrl/Order/send-order-confirmation', token: token, {});
    print(response.data);
    return response.data;
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await apiService.get(
      '$baseUrl/Order/GetOrder',
      token: token,
    );
    if (response.data is List<dynamic>) {
      final List<dynamic> order = response.data;
      List<OrderEntity> orders = order.map((order) {
        final List<dynamic> items = order['Items'] ?? [];
        List<OrderItemEntity> products = items.map((item) {
          return OrderItemModel.fromJson(item as Map<String, dynamic>);
        }).toList();

        return OrderEntity(
          id: order['Id'] as String,
          userId: order['UserId'] as String,
          totalPrice: (order['TotalPrice'] as num).toDouble(),
          items: products,
        );
      }).toList();

      return orders;
    } else {
      throw Exception('Invalid response format');
    }
  }

  @override
  Future<void> deleteOrder({required String orderId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await apiService
        .delete('$baseUrl/Order/Remove-Order/$orderId', {}, token: token);
    print(response.data);
    return response.data;
  }
}
