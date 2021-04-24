import 'package:api_sustainability/screens/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shop/helpers/custom_route.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Offcet'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Market'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Tracker'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName);
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
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
