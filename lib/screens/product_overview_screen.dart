import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/products_grid.dart';

import '../models/products.dart';

class ProductOverviewScreen extends StatefulWidget {

  const ProductOverviewScreen({ Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final showFavoritesOnly = Provider.of<Products>(context).getShowFavoritesOnly;
    return ProductsGrid(showFavourites: showFavoritesOnly);
  }
}


