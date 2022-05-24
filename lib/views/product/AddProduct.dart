import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/utility/ApiHandler.dart';
import 'package:mvvm/resources/StyleResources.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {


  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduca"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: StyleResources.primaryTextstyle,),
              SizedBox(height: 10,),
              TextField(
                controller: _name,
                decoration: StyleResources.primaryTexyFeldDecoration,

                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10,),
              Text("Quantity",style: StyleResources.primaryTextstyle,),
              SizedBox(height: 10,),
              TextField(
                controller: _qty,
                decoration: StyleResources.primaryTexyFeldDecoration,

                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              Text("Price",style: StyleResources.primaryTextstyle,),
              SizedBox(height: 10,),
              TextField(
                controller: _price,
                decoration: StyleResources.primaryTexyFeldDecoration,

                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: ()async{

                    var name = _name.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();
                    if(name.length<=0)
                      {
                        Fluttertoast.showToast(
                            msg: "Please Add Name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    else if(qty.length<=0)
                      {
                        Fluttertoast.showToast(
                            msg: "Please Add Quantity",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    else if(price.length<=0)
                      {
                        Fluttertoast.showToast(
                            msg: "Please Add Quantity",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                   else{
                    //provider.addProduct(name,qty,price);
                      Map<String,String> params = {
                        "pname":name,
                        "qty":qty,
                        "price":price
                      };
                      await provider.addProduct(params);


                      if(provider.isinserted==true)
                        {
                            Fluttertoast.showToast(
                                msg:provider.msg,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                        }
                      else
                        {
                          Fluttertoast.showToast(
                              msg:"Fail",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }

                     // Uri url = Uri.parse(UrlResources.ADD_PRODUCT_JSON);
                     // var response  =  await http.post(url,body: {
                     //   "pname":name,
                     //   "qty":qty,
                     //   "price":price
                     // });
                     // if(response.statusCode==200)
                     //   {
                     //     var body = response.body.toString();
                     //     var json = jsonDecode(body);
                     //     var msg = json["message"].toString();
                     //     Fluttertoast.showToast(
                     //         msg:msg,
                     //         toastLength: Toast.LENGTH_SHORT,
                     //         gravity: ToastGravity.CENTER,
                     //         timeInSecForIosWeb: 1,
                     //         backgroundColor: Colors.green,
                     //         textColor: Colors.white,
                     //         fontSize: 16.0
                     //     );
                     //     _name.text= "";
                     //     _qty.text="";
                     //     _price.text="";
                     //
                     //
                     //   }
                    }

                  },

                 style: StyleResources.primaryButtonPaddingColor,
                  child: Text("Add"),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
