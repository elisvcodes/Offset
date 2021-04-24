import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import '../providers/products.dart';
import '../providers/product.dart';

import 'package:intl/intl.dart';
import '../providers/auth.dart';

math.Random random = new math.Random();
final double _initCarbonUsage = 100, _initLifeTimeValue = 2;

class ProductDetailScreen extends StatefulWidget {
  // final String title;
  static const routeName = '/product-detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double _lifeTimeValue = _initLifeTimeValue;
  double _carbonUsage = _initCarbonUsage;
  double _estimatedPerYear = 1;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<double> _generateRandomData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(random.nextDouble() * 100);
    }
    return result;
  }

  List<double> _generateCarbonData(int count) {
    List<double> result = <double>[];
    for (int i = 0; i < count; i++) {
      result.add(_carbonUsage * (i / _lifeTimeValue).round());
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    _estimatedPerYear = 12 / _lifeTimeValue;
    // final product = Provider.of<Product>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    var data = _generateCarbonData(10);
    final flSpotData = List.generate(
            101, (i) => _carbonUsage * (i / _lifeTimeValue).round() / 10000)
        .map((x) => FlSpot(x / 3, (x)))
        .toList();
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Text(
                '${loadedProduct.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text('Add Product to Tracking'),
                onPressed: () {
                  loadedProduct.toggleFavoriteStatus(
                      authData.token, authData.userId);
                  final snackBar = SnackBar(
                    content: Text(
                      'Item is being Tracked!',
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        loadedProduct.toggleFavoriteStatus(
                            authData.token, authData.userId);
                      },
                    ),
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
                textColor: Theme.of(context).primaryColor,
              ),
              Text("Carbon cost per unit: ${_carbonUsage}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Slider(
                value: _carbonUsage,
                min: 1,
                max: _initCarbonUsage * 10,
                label: _carbonUsage.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _carbonUsage = value;
                  });
                },
              ),
              Text("Estimated lifespam of the product: ${_lifeTimeValue} month",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Slider(
                value: _lifeTimeValue,
                min: 1,
                max: 48,
                divisions: 48,
                label: _lifeTimeValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _lifeTimeValue = value;
                  });
                },
              ),
              Text("Estimated purchase per year: ${_estimatedPerYear} times",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Container(
                width: 300.0,
                height: 100.0,
                child: new Sparkline(
                  data: data,
                  lineColor: Colors.lightGreen[500],
                  fillMode: FillMode.below,
                  fillColor: Colors.lightGreen[200],
                  pointsMode: PointsMode.all,
                  pointSize: 5.0,
                  pointColor: Colors.amber,
                ),
              ),
              Text("Emisions Graph",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22.0, bottom: 20),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                              maxContentWidth: 100,
                              tooltipBgColor: Colors.orange,
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots
                                    .map((LineBarSpot touchedSpot) {
                                  final textStyle = TextStyle(
                                    color: touchedSpot.bar.colors[0],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  );
                                  return LineTooltipItem(
                                      '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                      textStyle);
                                }).toList();
                              }),
                          handleBuiltInTouches: true,
                          getTouchLineStart: (data, index) => 0,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            colors: [
                              Colors.black,
                            ],
                            spots: flSpotData,
                            isCurved: true,
                            isStrokeCapRound: true,
                            barWidth: 3,
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        minY: -1.5,
                        maxY: 4,
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            margin: 16,
                          ),
                          rightTitles: SideTitles(showTitles: false),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            margin: 16,
                          ),
                          topTitles: SideTitles(showTitles: false),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          drawVerticalLine: true,
                          horizontalInterval: 1.5,
                          verticalInterval: 5,
                          checkToShowHorizontalLine: (value) {
                            return value.toInt() == 0;
                          },
                          checkToShowVerticalLine: (value) {
                            return value.toInt() == 0;
                          },
                        ),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
