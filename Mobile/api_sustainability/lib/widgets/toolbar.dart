import 'package:flutter/material.dart';
import 'package:materialx_flutter/data/my_colors.dart';
import 'package:toast/toast.dart';

class CommonAppBar {
  static Widget getPrimaryAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: MyColors.primary, brightness: Brightness.dark,
      title: Text(title,),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {Navigator.pop(context);},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showToastClicked(context, "Seach");
          },
        ),
      ]
    );
  }

  static Widget getPrimarySettingAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: MyColors.primary, brightness: Brightness.dark,
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Search");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value){
              showToastClicked(context, value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Settings", child: Text("Settings"),
              ),
            ],
          )
        ]
    );
  }

  static Widget getPrimaryBackAppbar(BuildContext context, String title){
    return AppBar(
      backgroundColor: MyColors.primary, brightness: Brightness.dark,
      title: Text(title,),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showToastClicked(context, "Seach");
          },
      ),
    ]
    );
  }


  static void showToastClicked(BuildContext context, String action){
    print(action);
    Toast.show(action+" clicked", context);
  }
}
