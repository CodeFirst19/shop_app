import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/orders.dart' show Orders;
import 'package:shop_app/widgets/order_item.dart';

import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {

  static String routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ordersProvider = Provider.of<Orders>(context);

    final hasOrders = ordersProvider.orders.isNotEmpty ? true : false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: hasOrders ?
      ListView.builder(
          itemCount: ordersProvider.orders.length,
          itemBuilder: (ctx, index) => OrderItem(order: ordersProvider.orders[index]),
      ) : const Center(
        child: Text('You haven\'t placed any order yet!'),
      ),
      drawer: const AppDrawer(),
    );
  }
}
