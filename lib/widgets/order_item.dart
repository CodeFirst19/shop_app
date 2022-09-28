import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/orders.dart' as ord;

class OrderItem extends StatefulWidget {

  final ord.OrderItem order;

  const OrderItem({
    required this.order,
    Key? key
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          ListTile(
            title: Text('Order (${widget.order.products.length} items): \$${(widget.order.amount).toStringAsFixed(2)}'),
            subtitle: Text('Date: ' + DateFormat('dd/MM/yyy - hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: (){
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded) SizedBox(
            height: min(widget.order.products.length * 20.0 + 155, 250),
            child: Expanded(
              child: ListView(
                children: widget.order.products.map((p) => ListTile(
                  leading: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: FittedBox(child: Text('\$${p.price}', style: const TextStyle(color: Colors.black)),),
                    ), backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  title: Text(p.title),
                  subtitle: Text('Total: \$${(p.price * p.quantity).toStringAsFixed(2)}',),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('${p.quantity}'),
                  ),
                )
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
