import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
//import 'package:shop_app/screens/product_detail_screen.dart';

import '../models/cart.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: {'productId' : product.id}),
              child: Image.network(product.imageUrl, fit: BoxFit.cover,)
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.amber),
            ),
            leading: IconButton(
              icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border,),
              color: Colors.amber,
              onPressed: () => product.toggleFavouriteStatus(),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,),
              color: Colors.amber,
              onPressed: () => cart.addItem(
                  productId: product.id,
                  productTitle: product.title,
                  productPrice: product.price
              ),
            ),
          ),
      ),
    );
      //Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    //   child: Container(
    //     padding: const EdgeInsets.all(1),
    //     width: 200,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(7),
    //         color: Colors.grey),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           width: double.infinity,
    //           height: 130,
    //           child: ClipRRect(
    //             borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(7),
    //                 topRight: Radius.circular(7)),
    //             child: GestureDetector(
    //               onTap:  () => Navigator.of(context).pushNamed(
    //                   ProductDetailScreen.productDetails,
    //                   arguments: {'productId': product.id}
    //               ),
    //               child: Image.network(
    //                 product.imageUrl,
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(product.title,
    //                     style: const TextStyle(
    //                         fontSize: 15,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     '\$${product.price}',
    //                     style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.amber),
    //                   ),
    //                 ],
    //               ),
    //               GestureDetector(
    //                   child: Icon(
    //                       product.isFavourite ? Icons.favorite : Icons.favorite_border
    //                   ),
    //                   onTap: () => product.toggleFavouriteStatus(),
    //               ),
    //               const Icon(Icons.shopping_cart_outlined)
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
