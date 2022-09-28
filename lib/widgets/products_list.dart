import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import 'product_card.dart';
import 'product_item.dart';

class ProductsList extends StatelessWidget {

  final bool showFavourites;

  ProductsList({required this.showFavourites});

  @override
  Widget build(BuildContext context) {
    // The buid method of this widget will be rebuilt when the instance of the provider class changes
    // This rebuilt will not however affect the parent widget
    // This is a listerner
    final productsProvider = Provider.of<Products>(context);
    // List of products
    final products = showFavourites ? productsProvider.favouriteItems : productsProvider.items;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              'New Collection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          //Search Box
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your item...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Recommendation Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              'Recommended for you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Product Card
          SizedBox(
            height: 200,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length ~/2,
                itemBuilder: (ctx, index) {
                  return ProductCard(
                    productId: products[index].id,
                    productTitle: products[index].title,
                    productDescription: products[index].description,
                    productPrice: products[index].price,
                    productImageUrl: products[index].imageUrl,
                  );
                }),
          ),
          // More products Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              'Browse for more products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ListView
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                //Alt: Use named constructor <value>. Use <create> if you want to use
                // the ctx param - Right approach to use when using provider with something
                // that is part of a list, pageview, or grid or any iterable widget
                // recommended for reusable/recycled widget <products[index]> because we access it
                // more than once
                // we use <create> mostly when we instantiance new widget e.g. check main.dart
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    //create: (ctx) => products[index],
                    value: products[index],
                    child: const ProductItem(),
                  )
                ),
          ),
        ],
      ),
    );
  }
}
