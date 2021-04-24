import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsListCost extends StatelessWidget {
  final bool showFavs;
  var _totalConsumptionCosts = 0.0;
  ProductsListCost(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return ListView(children: <Widget>[
      Text('Section 1 Header'),
      GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          _totalConsumptionCosts += products[i].carbon;
          return ChangeNotifierProvider.value(
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
      )
    ]);
  }
}
