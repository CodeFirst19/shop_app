import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem({ required String productId, required String productTitle, required double productPrice}) {
    if (_items.containsKey(productId)) {
      //Update cart item if it exists already
      // Update method gives us old cart item that we use to update it and return new updated cart item
      _items.update(productId, (existingCartItem) =>
        CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price)
      );
    } else {
      // Add new cart item if it does not exists
      _items.putIfAbsent(productId, () => CartItem(
          id: DateTime.now().toString(),
          title: productTitle,
          quantity: 1,
          price: productPrice)
      );
    }
  }
}