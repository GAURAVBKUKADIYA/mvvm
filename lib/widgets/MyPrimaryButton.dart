import 'package:flutter/material.dart';

import '../resources/StringResources.dart';
import '../resources/StyleResources.dart';

class MyPrimaryButton extends StatefulWidget {

  var buttontext="";
  GestureTapCallback onclick;
  Icon btnicon;

  MyPrimaryButton({this.buttontext,this.onclick,this.btnicon});

  @override
  State<MyPrimaryButton> createState() => _MyPrimaryButtonState();
}

class _MyPrimaryButtonState extends State<MyPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onclick,
      child: Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration (
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: StyleResources.primaryButton),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.buttontext,style: StyleResources.primaryTextstyle),
            widget.btnicon
          ],
        ),
      ),
    );
  }
}
