import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../providers/EmployedProvider.dart';
import '../../widgets/MyEmployedListItem.dart';

class ViewEmployedSecond extends StatefulWidget {


  @override
  State<ViewEmployedSecond> createState() => _ViewEmployedSecondState();
}

class _ViewEmployedSecondState extends State<ViewEmployedSecond> {

  EmployedProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployedProvider>(context,listen: false);

  }



  @override
  Widget build(BuildContext context) {

    provider = Provider.of<EmployedProvider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("ViewEmployed"),
        ),
      ),
      body:(provider.alldata!=null)?ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index){
          if(provider.alldata[index].ename=="abc")
            {
              return MyEmployedListItem(obj: provider.alldata[index],
                deleteClick: ()async{
                  AlertDialog alert = AlertDialog(
                    title: Text("Are You Sure",style: TextStyle(color: Colors.red),),
                    content: Text("This Employed Data has Delete"),
                    actions: [
                      ElevatedButton(
                        onPressed: ()async{
                          var eid = provider.alldata[index].eid.toString();
                          Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteEmployeeNormal.php");
                          var response = await http.post(url,body: {"eid":eid});
                          if(response.statusCode==200)
                          {
                            var body = response.body.toString();
                            var json = jsonDecode(body);
                            if(json["status"]=="true")
                            {
                              Navigator.of(context).pop();
                              // setState(() {
                              //   provider. alldata = getemployed();
                              // });
                            }
                          }
                        },

                        child: Text("Yes"),
                      ),
                      ElevatedButton(
                        onPressed: ()async{
                          Navigator.of(context).pop();
                        },

                        child: Text("No"),
                      ),

                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },

                updateClick: ()async{},
              );
            }

        },
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
