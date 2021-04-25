import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import 'package:flutter_sparkline/flutter_sparkline.dart';
import '../providers/product.dart';
import './product_item.dart';
import '../widgets/my_text.dart';

class ProductsListCost extends StatefulWidget {
  final bool showFavs;

  ProductsListCost(this.showFavs);

  @override
  _ProductsListCostState createState() => _ProductsListCostState();
}

class _ProductsListCostState extends State<ProductsListCost> {
  final marginLeftOnly = EdgeInsets.only(left: 20, right: 20);
  final marginLeftDouble = EdgeInsets.only(left: 40, right: 40);
  List<double> _generateCarbonData(int count, List<Product> trackedProducts) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      double sum = 0;
      trackedProducts.forEach((element) {
        sum += (element.carbon * (i / element.lifespam).round());
      });
      // print(sum);
      result.add(sum);
    }
    return result;
  }

  List<Widget> tagChips = [];

  @override
  void initState() {
    tagChips.add(Chip(label: Text('black')));
    tagChips.add(Chip(label: Text('city')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products = productsData.trackedItems;

    var _totalConsumptionCostsPerYear =
        productsData.trackedTotalEmissionPerYear;

    var co2EmissionData = _generateCarbonData(12, productsData.trackedItems);
// TODO: Untrack items and update the costs
    void untracker() {}

    return ListView(children: <Widget>[
      VerticalSpace(),
      Text(
        'Tracked Items',
        style: MyText.display3(context),
        textAlign: TextAlign.center,
      ),
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
      VerticalSpace(
        height: 40,
      ),
      // Text(
      //               "Lifespan: ${_lifeTimeValue.toStringAsFixed(3)} (months)",
      //               style: MyText.body2(context)),
      Text(
        "Tracked Items Data",
        style: MyText.display1(context),
        textAlign: TextAlign.center,
      ),
      VerticalSpace(),
      Padding(
        padding: marginLeftOnly,
        child: Text(
          "Tracked Items CO2 Emission (grams/year)",
          style: MyText.body1(context),
        ),
      ),
      VerticalSpace(
        height: 5,
      ),
      Padding(
        padding: marginLeftDouble,
        child: Text(
            "Per Year: ${_totalConsumptionCostsPerYear.toStringAsFixed(2)},",
            style: MyText.body1(context)),
      ),
      Padding(
        padding: marginLeftDouble,
        child: Text(
            "Per month: ${productsData.trackedTotalEmissionPerMonth.toStringAsFixed(2)}",
            style: MyText.body1(context)),
      ),
      Padding(
        padding: marginLeftDouble,
        child: Text(
            "Per day: ${productsData.trackedTotalEmissionPerDay.toStringAsFixed(2)}",
            style: MyText.body1(context)),
      ),
      Padding(
        padding: marginLeftOnly,
        child: Container(
          width: 300.0,
          height: 100.0,
          child: new Sparkline(
            data: co2EmissionData,
            lineColor: Colors.grey[500],
            fillMode: FillMode.below,
            fillColor: Colors.grey[200],
            pointsMode: PointsMode.all,
            pointSize: 5.0,
            pointColor: Colors.grey,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Wrap(
                spacing: 10,
                children: tagChips,
              ),
            ),
          ],
        ),
      ),
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
