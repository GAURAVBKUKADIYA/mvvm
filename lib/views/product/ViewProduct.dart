import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/utility/ApiHandler.dart';
import 'package:mvvm/models/Product.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/views/product/ViewProductSecond.dart';
import 'package:mvvm/widgets/MyProductListItem.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';
import '../../providers/UpdateProductProvider.dart';
import '../../utility/error_handler.dart';
import 'UpdateProduct.dart';

class ViewProduct extends StatefulWidget {
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  ProductProvider provider;

  getproduct() async {

    await provider.viewproduct();


    // Uri url = Uri.parse(UrlResources.VIEW_PRODUCT_JSON);
    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   var body = response.body.toString();
    //   var json = jsonDecode(body);
    //   setState(() {
    //     alldata = json["data"].map<Product>((obj)=>Product.fromJson(obj)).toList();
    //   });
    // } else {
    //   print("API Error");
    // }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("View Product"),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewProductSecond()));
          }, icon: Icon(Icons.stacked_bar_chart))
        ],
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
              itemCount: provider.alldata.length,
              itemBuilder: (context, index) {
                return MyProductListItem(obj: provider.alldata[index],
                deleteClick: () async{
                  AlertDialog alert = AlertDialog(
                    title: Text(
                      "Are You Sure",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text("This Product Data Has Delete"),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {

                          Map<String,String> params = {
                            "pid":provider.alldata[index].pid.toString(),
                          };
                          await provider.deleteproduct(context,params);
                          if(provider.isdelete==true)
                          {
                            Fluttertoast.showToast(
                                msg:provider.msg,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Navigator.of(context).pop();
                            await provider.viewproduct();
                          }


                         // var pid = provider.alldata[index].pid.toString();
                          // Uri url = Uri.parse(
                          //     UrlResources.DELETE_PRODUCT_NORMAL);
                          // var response = await http
                          //     .post(url, body: {'pid': pid});
                          // if (response.statusCode == 200) {
                          //   var body = response.body.toString();
                          //   var json = jsonDecode(body);
                          //   if (json["status"] == "true") {
                          //     Navigator.of(context).pop();
                          //     setState(() {
                          //       provider.alldata = getproduct();
                          //     });
                          //   }
                          // }
                        },
                        child: Text("Yes"),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text("No"))
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                  updateClick: ()async{
                    AlertDialog alert = AlertDialog(
                        title: Text(
                        "Are You Sure",
                        style: TextStyle(color: Colors.blue),
                    ),
                    content: Text("This Product has update"),
                    actions: [



                      ElevatedButton(
                          onPressed: () async {
                            var pid = provider.alldata[index].pid.toString();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>UpdateProductProvider(updateid: pid,))
                            );
                          },
                          child: Text("ProviderUpdate")),








                      ElevatedButton(
                          onPressed: () async {
                            var pid = provider.alldata[index].pid.toString();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateProduct(
                                  updatepid: pid,
                                )));
                          },
                          child: Text("Update"))

                    ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );



                  },
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
