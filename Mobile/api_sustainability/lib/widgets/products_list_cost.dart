import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsListCost extends StatefulWidget {
  final bool showFavs;

  ProductsListCost(this.showFavs);

  @override
  _ProductsListCostState createState() => _ProductsListCostState();
}

class _ProductsListCostState extends State<ProductsListCost> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products =
        widget.showFavs ? productsData.favoriteItems : productsData.items;

    var _totalConsumptionCostsPerYear =
        productsData.trackedTotalEmissionPerYear;
// TODO: Untrack items and update the costs
    void untracker() {}

    return ListView(children: <Widget>[
      GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          // print(_totalConsumptionCostsPerYear);

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
      ),
      Text(
          "Tracked Items Total CO2 Per Year: ${_totalConsumptionCostsPerYear}," +
              "per month: ${productsData.trackedTotalEmissionPerMonth}" +
              " per day: ${productsData.trackedTotalEmissionPerDay}"),
      Row(
          children: productsData.trackedCategories
              .map((item) => new Text(item))
              .toList()),
      Row(
          children: productsData.trackedCategories
              .map((item) => new Text(item))
              .toList())
    ]);
  }
}
