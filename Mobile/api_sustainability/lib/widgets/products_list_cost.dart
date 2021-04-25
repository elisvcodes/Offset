import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

import 'package:charts_flutter/flutter.dart' as charts;
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
  var isFirstBuild = true;
  static var chartDisplayEmissions;

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
    // tagChips.add(Chip(label: Text('city')));
    //
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

    void updateGraph() {
      List<addcharts> chartsEmissionsData = [];

      // productsData.getAlternatives(loadedProduct).toList().forEach((prod) {
      //   // print("added ${prod.title} ca: ${prod.carbon}");
      //   chartsEmissionsData.add(addcharts(prod.title, prod.carbon.toInt()));
      // });

      chartsEmissionsData.add(
          addcharts("yours", productsData.trackedTotalEmissionPerYear.toInt()));

      chartsEmissionsData.add(addcharts("Generic",
          productsData.trackedCategoriesGenericsEmissionPerYear.toInt()));

      chartsEmissionsData.add(addcharts(
          "Saved",
          productsData.trackedCategoriesGenericsEmissionPerYear.toInt() -
              productsData.trackedTotalEmissionPerYear.toInt()));

      setState(() {
        var seriesEmissions = [
          charts.Series(
            domainFn: (addcharts addcharts, _) => addcharts.label,
            measureFn: (addcharts addcharts, _) => addcharts.value,
            colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
            id: 'addcharts',
            data: chartsEmissionsData,
          )
        ];

        chartDisplayEmissions = charts.BarChart(
          seriesEmissions,
          // animationDuration: Duration(microseconds: 5000),
          animate: false,
        );
      });
    }

    void calledFirstBuild() {
      updateGraph();
      productsData.trackedCategories.forEach((cateogry) {
        setState(() {
          tagChips.add(Chip(label: Text(cateogry)));
        });
      });
    }

    if (isFirstBuild) {
      calledFirstBuild();
      setState(() {
        isFirstBuild = false;
      });
    }

    bool isAnyTracking =
        productsData.trackedCategories.length > 0 ? true : false;

    return isAnyTracking
        ? ListView(children: <Widget>[
            VerticalSpace(),
            Text(
              'Tracked Items',
              style: MyText.display3(context),
              textAlign: TextAlign.center,
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
            Text(
              "CO2 EMISSION",
              style: MyText.subhead(context),
              textAlign: TextAlign.center,
            ),

            VerticalSpace(
              height: 5,
            ),
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
                  "Per year: ${_totalConsumptionCostsPerYear.toStringAsFixed(2)},",
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
            VerticalSpace(
              height: 40,
            ),
            Text(
              "YOUR CHOICES vs GENERIC ",
              style: MyText.subhead(context),
              textAlign: TextAlign.center,
            ),
            VerticalSpace(
              height: 5,
            ),
            Padding(
              padding: marginLeftOnly,
              child: Text(
                "CO2 (g/year)",
                style: MyText.body1(context),
              ),
            ),
            Padding(
              padding: marginLeftDouble,
              child: Text(
                  "Yours: ${_totalConsumptionCostsPerYear.toStringAsFixed(2)}",
                  style: MyText.body1(context)),
            ),
            Padding(
              padding: marginLeftDouble,
              child: Text(
                  "Generic: ${productsData.trackedCategoriesGenericsEmissionPerYear.toStringAsFixed(2)}",
                  style: MyText.body1(context)),
            ),
            Padding(
              padding: marginLeftDouble,
              child: Text(
                  "Saved: ${(productsData.trackedCategoriesGenericsEmissionPerYear - _totalConsumptionCostsPerYear).toStringAsFixed(2)}",
                  style: MyText.body1(context)),
            ),

            Padding(
              padding: marginLeftOnly,
              child: SizedBox(
                height: 150,
                child: chartDisplayEmissions,
              ),
            ),
            VerticalSpace(
              height: 40,
            )
          ])
        : ListView(children: <Widget>[
            VerticalSpace(
              height: 40,
            ),
            Text(
              'No product is being tracked.',
              style: MyText.headline(context),
              textAlign: TextAlign.center,
            ),
            VerticalSpace(),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "To add a product go to marketplace and tap on the tracking icon.",
                style: MyText.body1(context),
              ),
            ),
          ]);
  }
}
