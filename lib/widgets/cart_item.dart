import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem({
    Key? key,
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: IconButton(
          icon: const Icon(Icons.delete_forever),
          color: Colors.white,
          onPressed: (){},
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: FittedBox(child: Text('\$$price', style: const TextStyle(color: Colors.black)),),
                  ), backgroundColor: Theme.of(context).colorScheme.background,
              ),
              title: Text(title),
              subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}',),
              trailing: Text('$quantity'),
            ),
          )
      ),
    );
  }
}
