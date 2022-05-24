import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/utility/ApiHandler.dart';
import 'package:mvvm/resources/StyleResources.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/resources/UrlResources.dart';
import 'package:provider/provider.dart';

import '../../providers/EmployedProvider.dart';

class AddEmployed extends StatefulWidget {
  @override
  State<AddEmployed> createState() => _AddEmployedState();
}

class _AddEmployedState extends State<AddEmployed> {
  TextEditingController _name = TextEditingController();
  TextEditingController _sallary = TextEditingController();


  EmployedProvider provider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployedProvider>(context,listen: false);
  }

  var _gender = "male";
  var _select = "Marketing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AddEmployed"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: StyleResources.primaryTextstyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _name,
                decoration: StyleResources.primaryTexyFeldDecoration,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sallary",
                style: StyleResources.primaryTextstyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _sallary,
                decoration: StyleResources.primaryTexyFeldDecoration,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio(
                    activeColor: Colors.blue,
                    groupValue: _gender,
                    value: "male",
                    onChanged: (val) {
                      setState(() {
                        _gender = val;
                      });
                    },
                  ),
                  Text(
                    "male",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    activeColor: Colors.green,
                    groupValue: _gender,
                    value: "other",
                    onChanged: (val) {
                      setState(() {
                        _gender = val;
                      });
                    },
                  ),
                  Text(
                    "female",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    activeColor: Colors.red,
                    groupValue: _gender,
                    value: "female  ",
                    onChanged: (val) {
                      setState(() {
                        _gender = val;
                      });
                    },
                  ),
                  Text(
                    "Male",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 5,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Department :-",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton(
                    value: _select,
                    onChanged: (val) {
                      setState(() {
                        _select = val;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Employed"),
                        value: "Employed",
                      ),
                      DropdownMenuItem(
                        child: Text("Marketing"),
                        value: "Marketing",
                      ),
                      DropdownMenuItem(
                        child: Text("Production"),
                        value: "Production",
                      ),
                      DropdownMenuItem(
                        child: Text("Staff"),
                        value: "Staff",
                      ),
                      DropdownMenuItem(
                        child: Text("Delivery"),
                        value: "Delivery",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var name = _name.text.toString();
                    var sallary = _sallary.text.toString();
                    var gender = _gender.toString();
                    var select = _select.toString();

                    if (name.length <= 0) {
                      Fluttertoast.showToast(
                          msg: "Add your Name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (sallary.length <= 0) {
                      Fluttertoast.showToast(
                          msg: "Add your Sallary",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {

                   //   provider.addemployed(name,sallary,gender,select);
                      Map<String,String> params = {
                        "ename": name,
                        "salary": sallary,
                        "department": select,
                        "gender": gender
                      };
                   await  provider.addemployed(params);

                   if(provider.isinserted==true)
                     {
                       Fluttertoast.showToast(
                                   msg:"SuscessFull Add",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.CENTER,
                                   timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.green,
                                   textColor: Colors.white,
                                   fontSize: 16.0
                               );
                       _name.text="";
                       _sallary.text="";
                     }
                   else{
                     Fluttertoast.showToast(
                                 msg:"Fail To Add",
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.CENTER,
                                 timeInSecForIosWeb: 1,
                                 backgroundColor: Colors.red,
                                 textColor: Colors.white,
                                 fontSize: 16.0
                             );
                     _name.text="";
                     _sallary.text="";

                   }
                    }
                  },
                  style: StyleResources.primaryButtonPaddingColor,
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
