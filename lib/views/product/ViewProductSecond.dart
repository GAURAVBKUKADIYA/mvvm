import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../providers/ProductProvider.dart';
import '../../resources/UrlResources.dart';
import '../../widgets/MyProductListItem.dart';
import 'UpdateProduct.dart';

class ViewProductSecond extends StatefulWidget {

  @override
  State<ViewProductSecond> createState() => _ViewProductSecondState();
}

class _ViewProductSecondState extends State<ViewProductSecond> {

  ProductProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("View Product second"),
        ),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          if(provider.alldata[index].pname=="pen")
            {
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
                          var pid = provider.alldata[index].pid.toString();
                          Uri url = Uri.parse(
                              UrlResources.DELETE_PRODUCT_NORMAL);
                          var response = await http
                              .post(url, body: {'pid': pid});
                          if (response.statusCode == 200) {
                            var body = response.body.toString();
                            var json = jsonDecode(body);
                            if (json["status"] == "true") {
                              Navigator.of(context).pop();
                              // setState(() {
                              //   provider.alldata = getproduct();
                              // });
                            }
                          }
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
                updateClick: (){
                  var pid = provider.alldata[index].pid.toString();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateProduct(
                        updatepid: pid,
                      )));
                },
              );
            }

        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
