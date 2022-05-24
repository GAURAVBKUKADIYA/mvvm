import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/utility/error_handler.dart';

import '../ErrorMeassage.dart';
import '../models/Employed.dart';
import '../resources/UrlResources.dart';
import '../utility/ApiHandler.dart';
import 'package:http/http.dart' as http;

class EmployedProvider extends ChangeNotifier {
  var isinserted = false;
  var isdelete = false;

  addemployed(params) async {
    try {
      await ApiHandler.post(UrlResources.ADD_EMPLOYED_NORMAL, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isinserted = true;
        } else {
          isinserted = false;
        }
      });
    } on ErrorHandler catch (ex) {
      (ex.message.toString());
      print("No Internet");
      // Navigator.of(context).push(
      //      MaterialPageRoute(builder: (context)=>ErrorMeassage())
      //  );
    }
  }

  List<Employed> alldata;

  viewemployed(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_EMPLOYED).then((json) {
        alldata = json["data"]
            .map<Employed>((obj) => Employed.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
      (ex.message.toString());
      print("No Internet");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ErrorMeassage()));
    }
  }
}

deleteemployed(context)async{
  try{

  }
  on ErrorHandler catch (ex) {
    (ex.message.toString());
    print("No Internet");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ErrorMeassage()));
  }

}

