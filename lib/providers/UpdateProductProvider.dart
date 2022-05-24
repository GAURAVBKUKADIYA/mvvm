import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../resources/StyleResources.dart';
import '../resources/UrlResources.dart';
import 'ProductProvider.dart';
class UpdateProductProvider extends StatefulWidget {

  var updateid = "";

  UpdateProductProvider({this.updateid});

  @override
  State<UpdateProductProvider> createState() => _UpdateProductProviderState();
}

class _UpdateProductProviderState extends State<UpdateProductProvider> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();
  ProductProvider provider;




  getdata()async{
    Uri url = Uri.parse(UrlResources.GET_SINGLE_PRODUCT);
    var response = await http.post(url, body: {"pid": widget.updateid});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      if (json["status"] == "true") {
        setState(() {
          _name.text = json["data"]["pname"].toString();
          _qty.text = json["data"]["qty"].toString();
          _price.text = json["data"]["price"].toString();
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Center(
        child: Text("Update Product Provider"),),),

    body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ProductName",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                "Qty",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _qty,
                decoration: StyleResources.primaryTexyFeldDecoration,
                keyboardType: TextInputType.number,
              ),
              Text(
                "Price",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _price,
                decoration: StyleResources.primaryTexyFeldDecoration,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var name = _name.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();

                    Map<String, String> params={
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updateid
                    };

                    await provider.updateproduct(context, params);
                    if(provider.isupdted)
                      {
                        Fluttertoast.showToast(
                            msg: "Sucsess FulL Update",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        await provider.viewproduct();
                        Navigator.of(context).pop();
                      }

                  },
                  child: Text("Update"),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
