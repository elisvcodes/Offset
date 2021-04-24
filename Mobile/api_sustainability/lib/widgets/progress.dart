import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materialx_flutter/data/my_colors.dart';

class Progress {

  static Widget getFlatProgressAccent(int value, double height){
    int rest = 100 - value;
    return Stack(
      children: <Widget>[
        Text("Sadsd"),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(height: height, color: MyColors.accentLight,),
              flex: 100,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(width: 200, height: 20, color: MyColors.accent,),
              flex: value,
            ),
            Expanded(
              child: Container(),
              flex: rest,
            ),
          ],
        )
      ],
    );
  }
}