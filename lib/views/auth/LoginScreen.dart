import 'package:flutter/material.dart';
import 'package:mvvm/resources/StringResources.dart';
import 'package:mvvm/resources/StyleResources.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  Widget _loginbtn()
  {
    return Center(
      child: MyPrimaryButton(
        buttontext: StringResources.LOGIN_BTN_TEXT,
        btnicon: Icon(Icons.arrow_forward_outlined,color: Colors.white,),
        onclick: (){
          print("Login Click");
        },
      ),
    );
  }

  Widget _loginform()
  {
    return Column(
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
      ],
    );
  }

  Widget _createaccounttext()
  {
    return Align(
      child:  TextButton(
          onPressed: ()async{
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
          },
          child:Text("Create Account",style: TextStyle(fontSize: 18),))
      ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(StringResources.LOGIN_BTN_TEXT),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _loginform(),
              _loginbtn(),
              _createaccounttext(),
            ],
          ),
        ),
      ),
    );
  }
}
