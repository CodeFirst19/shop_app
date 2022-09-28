import 'package:flutter/cupertino.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder({ required List<CartItem> cartItems, required double totalAmout}) {
    var newOrder = OrderItem(
        id: DateTime.now().toString(),
        amount: totalAmout,
        products: cartItems,
        dateTime: DateTime.now()
    );

    _orders.add(newOrder);

    notifyListeners();
  }
}