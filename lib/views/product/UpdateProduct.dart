import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/resources/StyleResources.dart';

import 'dart:convert';

import 'package:mvvm/resources/UrlResources.dart';

import 'ViewProduct.dart';

class UpdateProduct extends StatefulWidget {

  var updatepid = "";

UpdateProduct({this.updatepid});
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  getdata() async {
    Uri url = Uri.parse(UrlResources.GET_SINGLE_PRODUCT);
    var response = await http.post(url, body: {"pid": widget.updatepid});
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
    getdata();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Update Product"),
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

                    Uri url = Uri.parse(UrlResources.UPDATE_PRODUCT_NORMAL);
                    var response = await http.post(url,body: {
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updatepid
                    });
                    if (response.statusCode == 200) {

                      var body = response.body.toString();
                      var json = jsonDecode(body);
                      if(json["status"]=="true")
                      {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ViewProduct()));
                      }
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
