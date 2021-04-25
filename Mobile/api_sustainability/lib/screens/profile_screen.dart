import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/widgets/my_text.dart';

import '../widgets/app_drawer.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';

import '../providers/auth.dart';

import '../providers/meta.dart';

import '../data/achievements.dart';

import '../widgets/dialog.dart';

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

    final metaData = Provider.of<Meta>(context);
    var _savedPerDay = productsData.emissionSavedPerDay;
    var _totalSaved = metaData.totalCarbonSaved;

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
            metaData.addDay(_savedPerDay);
            // dayCount++;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
            Text("${metaData.rank}",
                style: MyText.title(context).copyWith(color: MyColors.grey_90)),
            Container(height: 5),
            Text("< ${metaData.name} >",
                style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
            Container(height: 15),
            CircleAvatar(
              radius: 53,
              backgroundColor: Theme.of(context).accentColor,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(metaData.rankFile),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            ),
            Text("Achievements",
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
                        backgroundColor: Theme.of(context).accentColor,
                        elevation: 3,
                        child: Icon(
                          Icons.accessibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // This should bring you to open the menus thing
                          showDialog(
                              context: context,
                              builder: (_) => AccomplishmentDialog(
                                    title: achievements[0]["title"].toString(),
                                    description: achievements[0]["description"]
                                        .toString(),
                                    condition:
                                        achievements[0]["condition"].toString(),
                                  ));
                        },
                      ),
                      Container(width: 20, height: 90),
                      FloatingActionButton(
                        heroTag: "fab1",
                        backgroundColor: false
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        elevation: 3,
                        child: Icon(
                          Icons.accessibility,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      )
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
                            Text(
                                "${_totalSaved.toStringAsFixed(3)} grams of CO2 saved in total",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Text(
                                "${_savedPerDay.toStringAsFixed(3)} grams of CO2 saved per day",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Text("${metaData.dayCount} days in the app",
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
