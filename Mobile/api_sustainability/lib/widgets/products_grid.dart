import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

enum ShowOptions { ShowFavs, ShowGeneric, ShowGreen, ShowReusable, ShowAll }

class ProductsGrid extends StatelessWidget {
  ShowOptions showOption = ShowOptions.ShowAll;

  ProductsGrid(this.showOption);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    var products = productsData.items;

    switch (showOption) {
      case ShowOptions.ShowAll:
        {
          products = productsData.items;
        }
        break;
      case ShowOptions.ShowFavs:
        {
          products = productsData.trackedItems;
        }
        break;

      case ShowOptions.ShowGeneric:
        {
          products = productsData.genericItems;
        }
        break;

      case ShowOptions.ShowGreen:
        {
          products = productsData.greenItems;
        }
        break;

      case ShowOptions.ShowReusable:
        {
          products = productsData.reusableItems;
        }
        break;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
