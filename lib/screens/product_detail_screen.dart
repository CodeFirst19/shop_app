import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text.dart';
import '../models/products.dart';
import '../widgets/icon_counter.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {

  static String routeName = '/product-details';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final productId  = routeArgs['productId'];
    // Using the provider instance to get a single products
    // listen: false makes this widget not to be updated when the provider instance detects change
    final product = Provider.of<Products>(context, listen: false).findProductById(productId!);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Item Details'),
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<Cart>(
              builder: (ctx, cart, child) => IconCounter(icon: child!, counter: cart.itemsCount,),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart,),
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
              ),
            ),
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
                    children: [
                      const Text('Size', style: TextStyle(
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      const CustomText(text: 'S'),
                      const CustomText(text: 'M'),
                      const CustomText(text: 'L'),
                      const CustomText(text: 'XL'),

                      const SizedBox(height: 40,),

                      Text('\$${product.price}', style: const TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text('price')

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
              ),
              const SizedBox(height: 25,),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  child: const Text('Add To Cart'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),),),
                  onPressed: () => cart.addItem(
                      productId: product.id,
                      productTitle: product.title,
                      productPrice: product.price
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
