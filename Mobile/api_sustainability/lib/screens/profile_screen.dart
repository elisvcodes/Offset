import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_sustainability/data/img.dart';
import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/data/my_strings.dart';
import 'package:api_sustainability/widgets/my_text.dart';

class ProfileRedRoute extends StatefulWidget {
  ProfileRedRoute();

  @override
  ProfileRedRouteState createState() => new ProfileRedRouteState();
}

class ProfileRedRouteState extends State<ProfileRedRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.pink[600],
          brightness: Brightness.dark,
          title: Text("Profile"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (String value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ],
            )
          ]),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab3",
        backgroundColor: Colors.pink[600],
        elevation: 3,
        child: Icon(
          Icons.star,
          color: Colors.white,
        ),
        onPressed: () {
          print('Clicked');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
            Text("James Pratterson",
                style: MyText.title(context).copyWith(color: MyColors.grey_90)),
            Container(height: 5),
            Text("Graphic Designer",
                style: MyText.body1(context).copyWith(color: MyColors.grey_60)),
            Container(height: 15),
            CircleAvatar(
              radius: 53,
              backgroundColor: Colors.pink[600],
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Img.get("photo_male_7.jpg")),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Text(MyStrings.medium_lorem_ipsum,
                  textAlign: TextAlign.center,
                  style: MyText.subhead(context)
                      .copyWith(color: MyColors.grey_90)),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Recent Activity",
                      style: MyText.subhead(context).copyWith(
                          color: MyColors.grey_90,
                          fontWeight: FontWeight.bold)),
                  Container(height: 20),
                  Row(
                    children: <Widget>[
                      Image.asset(Img.get('photo_male_7.jpg'),
                          width: 40, height: 40),
                      Container(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("James Pratterson liked Marry's photo",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Container(height: 5),
                            Row(
                              children: <Widget>[
                                Icon(Icons.event,
                                    color: MyColors.grey_20, size: 15),
                                Container(width: 5),
                                Text("25 minutes ago",
                                    style: MyText.body1(context)
                                        .copyWith(color: MyColors.grey_40)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(height: 20),
                  Row(
                    children: <Widget>[
                      Image.asset(Img.get('photo_male_7.jpg'),
                          width: 40, height: 40),
                      Container(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("James Pratterson posted a note",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Container(height: 5),
                            Row(
                              children: <Widget>[
                                Icon(Icons.event,
                                    color: MyColors.grey_20, size: 15),
                                Container(width: 5),
                                Text("30 minutes ago",
                                    style: MyText.body1(context)
                                        .copyWith(color: MyColors.grey_40)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(Img.get('photo_male_7.jpg'),
                          width: 40, height: 40),
                      Container(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("James Pratterson liked Marry's photo",
                                style: MyText.body1(context)
                                    .copyWith(color: MyColors.grey_90)),
                            Row(
                              children: <Widget>[
                                Image.asset(Img.get('image_5.jpg'),
                                    width: 35, height: 35, fit: BoxFit.cover),
                                Container(width: 10),
                                Image.asset(Img.get('image_6.jpg'),
                                    width: 35, height: 35, fit: BoxFit.cover),
                                Container(width: 10),
                                Image.asset(Img.get('image_7.jpg'),
                                    width: 35, height: 35, fit: BoxFit.cover),
                                Container(width: 10),
                                Image.asset(Img.get('image_8.jpg'),
                                    width: 35, height: 35, fit: BoxFit.cover),
                                Container(width: 10),
                              ],
                            )
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
