import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:shop_app/widgets/section.dart';

import '../models/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourites;
  ProductsGrid({Key? key, required this.showFavourites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The buid method of this widget will be rebuilt when the instance of the provider class changes
    // This rebuilt will not however affect the parent widget
    // This is a listerner
    final productsProvider = Provider.of<Products>(context);
    // List of products
    final products = showFavourites ? productsProvider.favouriteItems : productsProvider.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Explore Collection',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        //Search bar
        Container(
          padding: const EdgeInsets.all(10),
          height: 80,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Find your item',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black)
              )
            ),
          )
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: const ProductItem(),
            ),
          ),
        )
      ],
    );
  }
}
