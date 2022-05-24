import 'package:flutter/material.dart';
import 'package:mvvm/models/Employed.dart';
import 'package:mvvm/providers/EmployedProvider.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/HomePage.dart';
import 'package:mvvm/views/auth/LoginScreen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ProductProvider()),
        ChangeNotifierProvider(create: (context)=> EmployedProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

