import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/custom_button.dart';
import '../utils/custom_text.dart';
import '../models/products.dart';

class ProductDetailScreen extends StatelessWidget {

  static String productDetails = 'product-details';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final productId  = routeArgs['productId'];
    // Using the provider instance to get a single products
    // listen: false makes this widget not to be updated when the provider instance detects change
    final product = Provider.of<Products>(context, listen: false).findProductById(productId!);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Item Details'),
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Column(
            children: [
              Text(product.title, style: const TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold),),
              Text(product.description),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //First Row
                    children: const [
                      Text('Size', style: TextStyle(
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      CustomText(text: 'S'),
                      CustomText(text: 'M'),
                      CustomText(text: 'L'),
                      CustomText(text: 'XL'),

                      SizedBox(height: 40,),

                      Text('\$170', style: TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('price')

                    ],
                  ),
                  //Second Row
                  Expanded(
                    child: SizedBox(
                      width: 250,
                      child: Image.network(product.imageUrl, fit: BoxFit.cover,),
                    ),
                  ),
                  //Third Row
                  Column(
                    children: const [
                      Text('Fav', style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      CustomButton(
                        icon: Icons.favorite_border,
                        conditionLabel: 'icon',
                        color: null,
                      ),

                      SizedBox(height: 60,),

                      CustomButton(
                        icon: Icons.favorite_border,
                        conditionLabel: 'color',
                        color: Colors.blue,
                      ),
                      CustomButton(
                        icon: Icons.favorite_border,
                        conditionLabel: 'color',
                        color: Colors.red,
                      ),
                      CustomButton(
                        icon: Icons.favorite_border,
                        conditionLabel: 'color',
                        color: Colors.black,
                      ),
                      Text('Color'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
