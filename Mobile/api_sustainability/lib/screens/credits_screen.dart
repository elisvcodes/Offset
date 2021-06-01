import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/my_text.dart';
import '../data/my_colors.dart';

int dayCount = 0;

bool firstTimeRendered = false;

class CreditsScreen extends StatefulWidget {
  static const routeName = '/credits-screen';
  CreditsScreen();

  @override
  CreditsScreenState createState() => new CreditsScreenState();
}

class CreditsScreenState extends State<CreditsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Credits'),
      ),
      // drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
          Padding(padding:  const EdgeInsets.only(left: 20, right: 20), child: Column(children: 
          [ 
            Text('Development Team', style: MyText.subhead(context).copyWith(color: MyColors.grey_100_,
                          fontWeight: FontWeight.bold),),
                          Container(height: 15)
            ,Text('App Development - Nelson Wang'),
          Text('Artwork - Eric Ma'),
          Text('Concept Design - Eli Sultanov, Eric Ma, Karl Zhu'),
          Text('Engineering - Eli Sultanov, Nelson Wang'),
          Text('Environmental Advisor - Federico Liu Yang'),
          Text('Research - Eric Ma, Federico Liu Yang'),
            
          ],), ),
            Container(height: 35),Padding(padding:  const EdgeInsets.only(left: 20, right: 20), child: Column(children: 
          [ 
            Text('Development Libraries', style: MyText.subhead(context).copyWith(color: MyColors.grey_100_,
                          fontWeight: FontWeight.bold),),
                          Container(height: 15)
            ,Text('cupertino_icons - Flutter.dev'),
          Text('flutter_sparkline - victor.oc@gmail.com'),
          Text('fl_chart - ikhoshabi.com'),
          Text('icofont_flutter - priyomukul@gmail.com'),
          Text('material_design_icons_flutter - mit@google.com, nshahan@google.com, cbraun@google.com, lorrainekan@google.com'),
          Text('charts_flutter - fluttercommunity.dev'),

         
          
          
            
          ],), ),

            Container(height: 35),Padding(padding:  const EdgeInsets.only(left: 20, right: 20), child: Column(children: 
          [ 
            Text('Assets', style: MyText.subhead(context).copyWith(color: MyColors.grey_100_,
                          fontWeight: FontWeight.bold),),
                          Container(height: 15)
            ,
InkWell(
              child: new Text('Marketplace Images - Collected from Amazon.com', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),),
              onTap: () => launch('https://www.amazon.com/')
          ),InkWell(
              child: new Text('Seed to tree Images - Jay Gregorio', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),),
              onTap: () => launch('https://www.elephango.com/index.cfm/pg/k12learning/lcid/13222/The_Life_Cycle_of_a_Tree')
          ),InkWell(
              child: new Text('Achievement Image - Wxbwfpocefl ', style: MyText.subhead(context).copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold),),
              onTap: () => launch('https://www.subpng.com/png-nhhkgx/')
          ),


         
          
          
            
          ],), ),



           
          ],
        ),
      ),
    );
  }
}