import 'package:flutter/material.dart';

class ErrorMeassage extends StatefulWidget {


  @override
  State<ErrorMeassage> createState() => _ErrorMeassageState();
}

class _ErrorMeassageState extends State<ErrorMeassage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Not Conect Internt"),
      ),
    );
  }
}
