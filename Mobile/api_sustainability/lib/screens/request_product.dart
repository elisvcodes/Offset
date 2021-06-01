import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/my_text.dart';
import '../data/my_colors.dart';

int dayCount = 0;


class RequestFeatureScreen extends StatefulWidget {
  static const routeName = '/feature-screen';
  RequestFeatureScreen();

  @override
  RequestFeatureScreenState createState() => new RequestFeatureScreenState();
}

class RequestFeatureScreenState extends State<RequestFeatureScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Request a Product'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
          Padding(padding:  const EdgeInsets.only(left: 20, right: 20), child: Column(children: [ Text('Complete the following form in order to request for a product to be added to the marketplace'),
            
          ],), ),
            Container(height: 35),

           
          Center(
          child: new InkWell(
              child: new Text('Open Form in your browser', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),),
              onTap: () => launch('https://docs.google.com/forms/d/e/1FAIpQLSd_YcWll_zvjlw5TEKPTstfEuQWuEqt1Beb0TRWphQDVZRIXA/viewform?usp=sf_link')
          ),
        ),
          ],
        ),
      ),
    );
  }
}