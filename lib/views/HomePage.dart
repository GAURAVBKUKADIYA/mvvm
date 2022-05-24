import 'package:flutter/material.dart';

import 'package:mvvm/views/product/AddProduct.dart';

import 'package:mvvm/views/product/ViewProduct.dart';

import 'employee/AddEmployed.dart';
import 'employee/ViewEmployed.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("HomePage"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("Api"),
              ),
              accountName: Text("Welcome MVVM Api Product Sheet"),
              accountEmail: Text("Welcome MVVM Api Employed Sheet"),
            ),
            Divider(height: 5,),
            ListTile(
              title: Text("AddProduct"),
              trailing: Icon(Icons.arrow_right_alt),
              leading: Icon(Icons.add_box),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProduct()));
              },

            ),
            Divider(height: 5,thickness: 2,),
            ListTile(
              title: Text("ViewProduct"),
              trailing: Icon(Icons.arrow_right_alt),
              leading: Icon(Icons.add_box),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ViewProduct())
                );
              },
            ),
            Divider(height: 5,thickness: 2,),
            ListTile(
              title: Text("AddEmployed"),
              trailing: Icon(Icons.arrow_right_alt),
              leading: Icon(Icons.add_box),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddEmployed())
                );
              },
            ),
            Divider(height: 5,thickness: 2,),
            ListTile(
              title: Text("ViewEmployed"),
              trailing: Icon(Icons.arrow_right_alt),
              leading: Icon(Icons.add_box),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployed())
                );
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}
