import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../providers/product.dart';
import './product_item.dart';

class ProductsListCost extends StatefulWidget {
  final bool showFavs;

  ProductsListCost(this.showFavs);

  @override
  _ProductsListCostState createState() => _ProductsListCostState();
}

class _ProductsListCostState extends State<ProductsListCost> {
  List<double> _generateCarbonData(int count, List<Product> trackedProducts) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      double sum = 0;
      trackedProducts.forEach((element) {
        sum += element.carbon * (i / element.lifespam).round();
      });
      result.add(sum);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products = productsData.favoriteItems;

    var _totalConsumptionCostsPerYear =
        productsData.trackedTotalEmissionPerYear;

    var co2EmissionData = _generateCarbonData(12, productsData.favoriteItems);
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
          children: productsData.trackedCategoriesGenerics
              .map((genericItem) => new Text(
                  "${genericItem.brand} | ${genericItem.itemTags} | ${genericItem.carbon} | ${genericItem.carbonPerYear}"))
              .toList()),
      Text(
          "Generics are ${productsData.trackedCategoriesGenericsEmissionPerYear}"),
      productsData.emissionSavedPerYear > 0
          ? Text(
              "Congratulations!, The earth thanks you for saving ${productsData.emissionSavedPerYear} every year!")
          : Container(),
    ]);
  }
}
