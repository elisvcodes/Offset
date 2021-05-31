import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/widgets/my_text.dart';

import 'package:intl/intl.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/auth.dart';
import '../providers/meta.dart';
import '../data/achievements.dart';
import '../widgets/dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

int dayCount = 0;

bool firstTimeRendered = false;

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

    if (!firstTimeRendered) {
      firstTimeRendered = true;

      metaData.fetchAndSetMeta(authData.userId);metaData.setTotalCarbonSaved(
                productsData.getTotalSavedUsingEachProductTracking);
    }

    // print(metaData.getDatesLastNowDifference());

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
          Icons.replay_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            // #TODO the following code is deprecated
            metaData.addDay(_savedPerDay);
            productsData.addTrackedProductsADay(authData.token, authData.userId,
                metaData.getDatesLastNowDifference());
            metaData.updateLastDateAsToday();
            metaData.postMeta(authData.token, authData.userId);
            
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
                backgroundImage: AssetImage(metaData.rankFile),
                // backgroundImage: AssetImage('assets/images/seed.PNG'),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(width: 20, height: 90),
                        AwardIcon(
                          index: 0,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 1,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 2,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 3,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 4,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 5,
                          totalSaved: _totalSaved,
                        ),
                        AwardIcon(
                          index: 6,
                          totalSaved: _totalSaved,
                        ),
                      ],
                    ),
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
                            Text(DateFormat('dd/MM/yyyy hh:mm')
                                .format(metaData.lastDateSync)),
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

class AwardIcon extends StatelessWidget {
  final double totalSaved;
  final int index;
  AwardIcon({
    Key key,
    @required this.totalSaved,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: FloatingActionButton(
        heroTag: "fab1",
        backgroundColor:
            int.parse(achievements[index]["carbon"].toString()) <= totalSaved
                ? Theme.of(context).accentColor
                : Colors.grey,
        elevation: 3,
        child: Icon(
          MdiIcons.trophy,
          color: Colors.white,
        ),
        onPressed:
            (int.parse(achievements[index]["carbon"].toString()) <= totalSaved)
                ? () {
                    // This should bring you to open the menus thing
                    showDialog(
                        context: context,
                        builder: (_) => AccomplishmentDialog(
                              title: achievements[index]["title"].toString(),
                              description:
                                  achievements[index]["description"].toString(),
                              condition:
                                  achievements[index]["condition"].toString(),
                            ));
                  }
                : null,
      ),
    );
  }
}
