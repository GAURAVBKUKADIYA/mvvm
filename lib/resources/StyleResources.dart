import 'package:flutter/material.dart';

class StyleResources {
  static Color primaryButton = Colors.blue.shade500;

  static TextStyle primaryTextstyle =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  static InputDecoration primaryTexyFeldDecoration = InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: const BorderRadius.all(const Radius.circular(20.0),),),);

  static   ButtonStyle primaryButtonPaddingColor = ElevatedButton.styleFrom(
    primary: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),);

  static BoxDecoration primaryContainerDecoration =BoxDecoration(
      border: Border.all(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))
  );

}
