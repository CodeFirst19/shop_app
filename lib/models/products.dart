import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import '../data/dummy_data.dart';

// With a provider, whenever data changes, the widgets which are listerning to it
// will be rebuilt.
class Products with ChangeNotifier {
  var _showFavoritesOnly = false;
  List<Product> _items = DUMMY_DATA;

  // Get list of products
  List<Product> get items {
    // if (_showFavouritesOnly) {
    //   return _items.where((product) => product.isFavourite).toList();
    // }
    return [..._items];
  }

  // Sets the value of this bool in the tabscreen, and gets it in the ProductsOverviewScreen
  void setShowFavoritesOnly(bool value) {
    _showFavoritesOnly = value;
    notifyListeners();
  }

  // Gets it in the ProductsOverviewScreen
  bool get getShowFavoritesOnly {
    return _showFavoritesOnly;
  }

  List<Product> get favouriteItems {
    return _items.where((product) => product.isFavourite).toList();
  }

  // void showFavouritesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }

  //Get a single product
  Product findProductById(String id) {
    return items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // TODO: Add product here
    notifyListeners();
  }
}