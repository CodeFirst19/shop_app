import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  final String productImageUrl;


  const ProductCard({
    Key? key,
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.productImageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Card(
        //color: Colors.grey[100],
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text(productTitle, style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      width: 170,
                      child: Text(productDescription)),
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    '\$$productPrice',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 12,),
                // Shop Now button
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: {'productId': productId}
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        width: 100,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(6)),),
                        child: Text('Shop Now', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),)),
                  ),
                ),
              ],
            ),
            Expanded(child: Image.network(productImageUrl, fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}
