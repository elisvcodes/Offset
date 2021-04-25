import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_sustainability/data/img.dart';
import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/data/my_strings.dart';
import 'package:api_sustainability/widgets/my_text.dart';

import '../widgets/app_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';

import '../providers/auth.dart';
import '../data/rank.dart';

int dayCount = 0;

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  ProfileScreen();

  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);
    final productsData = Provider.of<Products>(context);

    var _savedPerDay = productsData.emissionSavedPerDay;

    var _totalSaved = _savedPerDay * dayCount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab3",
        backgroundColor: Theme.of(context).accentColor,
        elevation: 3,
        child: Icon(
          Icons.plus_one,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            dayCount++;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
            Text("Rank ##",
                style: MyText.title(context).copyWith(color: MyColors.grey_90)),
            Container(height: 5),
            Text("< Demo User >",
                style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
            Container(height: 15),
            CircleAvatar(
              radius: 53,
              backgroundColor: Theme.of(context).accentColor,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Img.get("photo_male_7.jpg")),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            ),
            Text("Achievement",
                style: MyText.subhead(context).copyWith(
                    color: MyColors.grey_90, fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(width: 20, height: 90),
                      FloatingActionButton(
                        heroTag: "fab1",
                        backgroundColor: MyColors.primary,
                        elevation: 3,
                        child: Icon(
                          Icons.accessibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('Clicked');
                        },
                      ),
                      Container(width: 20, height: 0),
                      FloatingActionButton(
                        heroTag: "fab2",
                        backgroundColor: MyColors.primary,
                        elevation: 3,
                        child: Icon(
                          Icons.face,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('Clicked');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Details",
                      style: MyText.subhead(context).copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Container(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("$_totalSaved grams of CO2 saved in total",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Text(
                                "${_savedPerDay.toStringAsFixed(3)} grams of CO2 saved per day",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Text("$dayCount days in the app",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
