import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/my_text.dart';
import '../data/my_colors.dart';

import './contact_us_screen.dart';
import './credits_screen.dart';


class AboutScreen extends StatefulWidget {
  static const routeName = '/about-screes';
  AboutScreen();

  @override
  AboutScreenState createState() => new AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),

           Container(    
              child: FlatButton(  
                child: Text('Contact', style: TextStyle(fontSize: 20.0),),  
                onPressed: () {
                  Navigator.of(context).pushNamed(ContactUsScreen.routeName,
                                );
                },  
              ),  
            ), Container(  
              child: FlatButton(  
                child: Text('Credits', style: TextStyle(fontSize: 20.0),),  
                onPressed: () {
                  Navigator.of(context).pushNamed(CreditsScreen.routeName,
                                );
                },  
              ),  
              
            ),
            Container(height: 10,)
            , InkWell(
              child: new Text('Privacy Policy', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontSize: 20.0),),
              onTap: () => launch('https://theevilcorp.org/offset/policy.html')
          ),
          ],
        ),
      ),
    );
  }
}