import 'package:flutter/material.dart';
import 'package:mvvm/resources/StringResources.dart';

import '../../resources/StyleResources.dart';
import '../../widgets/MyPrimaryButton.dart';

class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("RegisterScreen"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Entere Your Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 10,),
              Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20,),
              Center(
                child: MyPrimaryButton(
                  buttontext: StringResources.REGISTER_BTN_TEXT,
                  btnicon: Icon(Icons.star,color: Colors.white,),
                  onclick: (){
                    print("Register Click");
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
