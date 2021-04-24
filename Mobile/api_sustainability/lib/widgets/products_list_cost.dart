import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsListCost extends StatelessWidget {
  final bool showFavs;
  var _totalConsumptionCosts = 0;
  ProductsListCost(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          // builder: (c) => products[i],
          value: products[i],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
