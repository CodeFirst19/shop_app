import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/orders.dart';
import '../widgets/cart_item.dart';
import '../models/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total', style: TextStyle(fontSize: 20),),
                      Chip(label: Text('\$${cart.getTotalAmount.toStringAsFixed(2)}'
                        ),
                      )
                  ],),
                  SizedBox(
                    width: 500,
                    child: ElevatedButton(
                        child: const Text('Order Now'),
                        style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),),),
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false)
                              .addOrder(
                              cartItems: cart.items.values.toList(growable: false),
                              totalAmout: cart.getTotalAmount
                          );
                          cart.clearCart();
                        },
                    ),
                  ),
                ]
                ),

              ),
            ),
            const SizedBox(width: 10,),
            const Divider(),
            Expanded(child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, index) => CartItem(
                    id: cart.items.values.toList()[index].id,
                    productId: cart.items.keys.toList()[index],
                    title: cart.items.values.toList()[index].title,
                    quantity: cart.items.values.toList()[index].quantity,
                    price: cart.items.values.toList()[index].price
                ),
              )
            )
          ],
        ));
  }
}
