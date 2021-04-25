import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_sustainability/data/img.dart';
import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/widgets/my_text.dart';

class AccomplishmentDialog extends StatefulWidget {
  String title;
  String description;
  String condition;
  AccomplishmentDialog({Key key, this.title, this.description, this.condition})
      : super(key: key);

  @override
  AccomplishmentDialogState createState() => new AccomplishmentDialogState();
}

class AccomplishmentDialogState extends State<AccomplishmentDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    Image.asset(
                      Img.get('badge_trophy.png'),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                    Container(height: 15),
                    Text("${widget.title}",
                        style: MyText.title(context)
                            .copyWith(color: Colors.black)),
                    Container(height: 20),
                    Text("${widget.description}",
                        textAlign: TextAlign.center,
                        style: MyText.subhead(context)
                            .copyWith(color: Colors.black87)),
                    Container(height: 10),
                    Text("${widget.condition}",
                        textAlign: TextAlign.center,
                        style: MyText.body1(context)
                            .copyWith(color: MyColors.grey_40)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
