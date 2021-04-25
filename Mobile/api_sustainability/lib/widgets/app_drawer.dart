import 'package:api_sustainability/screens/profile_screen.dart';
import 'package:api_sustainability/screens/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shop/helpers/custom_route.dart';
//
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              '🌳 Offset ',
              textAlign: TextAlign.center,
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidUser),
            title: Text('Profile'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName);
              Navigator.of(context)
                  .pushReplacementNamed(ProfileScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.storefront),
            title: Text('Marketplace'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment_turned_in),
            title: Text('Tracker'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(TrackerScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
