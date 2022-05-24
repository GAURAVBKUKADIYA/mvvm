import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../ErrorMeassage.dart';
import '../models/Product.dart';
import '../resources/UrlResources.dart';
import '../utility/ApiHandler.dart';
import '../utility/error_handler.dart';

class ProductProvider extends ChangeNotifier {

  // addProduct(name,qty,price) async
  // {
  //   try {
  //     await ApiHandler.post(UrlResources.ADD_PRODUCT_JSON,body: {
  //       "pname":name,
  //       "qty":qty,
  //       "price":price
  //     }).then((json){
  //       var msg = json["message"].toString();
  //     });
  //   } on ErrorHandler catch (ex) {
  //     if(ex.code.toString()=="500")
  //     {
  //       print("No Internet Page");
  //     }
  //   }
  // }

  var isdelete = false;
  var isinserted = false;
  var isupdted = false;
  var msg = "";

  addProduct(params) async
  {
    try {
      await ApiHandler.post(UrlResources.ADD_PRODUCT_JSON, body: params).then((
          json) {
        if (json["status"] == "true") {
          isinserted = true;
          msg = json["message"];
        }
        else {
          isinserted = false;
          msg = "";
        }
      });
    } on ErrorHandler catch (ex)
    {
      if (ex.code.toString() == "500")
      {
        print("No Internet Page");
      }
    }
  }


  List<Product> alldata;

  viewproduct() async {
    try {
      await ApiHandler.get(UrlResources.VIEW_PRODUCT_JSON).then((json) {
        alldata = json["data"]
            .map<Product>((obj) => Product.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex)
    {
      if (ex.code.toString() == "500")
      {
        print("No Internet Page");
      }
    }
  }


  deleteproduct(context , params) async {
    try {
      await ApiHandler.post(UrlResources.DELETE_PRODUCT_NORMAL,body: params).then((json) {
        if (json["status"] == "true") {
          isdelete = true;
          msg = json["message"];
        }
        else{
          isdelete  = false;
          msg = "";
        }
      });
    }
    on ErrorHandler catch (ex) {
      (ex.message.toString());
      print("No Internet");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ErrorMeassage()));
    }
  }

 updateproduct(context,params)async{
    try{

      await ApiHandler.post(UrlResources.UPDATE_PRODUCT_NORMAL,body: params).then((json){
        if(json["status"]=="true")
          {
            isupdted = true;
            msg = json["meassage"];
          }
        else{
          isupdted = false;
          msg = "";
        }
      });

    }
    on ErrorHandler catch (ex)
   {
     if (ex.code.toString()=="500")
       {
         print("No Internet Page");
       }
   }
 }




}