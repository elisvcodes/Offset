import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/my_text.dart';
import '../data/my_colors.dart';

int dayCount = 0;

bool firstTimeRendered = false;

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact-screen';
  ContactUsScreen();

  @override
  ContactUsScreenState createState() => new ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      // drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
          Padding(padding:  const EdgeInsets.only(left: 20, right: 20), child: Column(children: [ 
            Text('You can contact us in our very serious mail for anything:  ( Even if you just want to send us a picture about your cute dog or something)'),
            
          ],), ),
            Container(height: 35),

           
          Center(
          child: new InkWell(
              child: new Text('hahahaevilbusiness@gmail.com', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),),
              onTap: () => launch('mailto:hahahaevilbusiness@gmail.com')
          ),
        ),
          ],
        ),
      ),
    );
  }
}