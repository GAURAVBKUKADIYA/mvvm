import 'package:flutter/material.dart';
import 'package:mvvm/models/Employed.dart';

import '../resources/StyleResources.dart';

class MyEmployedListItem extends StatefulWidget {

  Employed obj;
  VoidCallback deleteClick;
  VoidCallback updateClick;

  MyEmployedListItem({this.obj,this.updateClick,this.deleteClick});

  @override
  State<MyEmployedListItem> createState() => _MyEmployedListItemState();
}

class _MyEmployedListItemState extends State<MyEmployedListItem> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration:StyleResources.primaryContainerDecoration,
      width: 200,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(widget.obj.ename.toUpperCase().toString(),style: StyleResources.primaryTextstyle,),
          Text(widget.obj.salary.toString(),),
          Text(widget.obj.department.toString()),
          Text(widget.obj.addedDatetime.toString()),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: widget.deleteClick,


                style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade800,
                    textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text("Delete"),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: ()async{},

                child: Text("Update"),
              ),
            ],
          )



        ],
      ),
    );
  }
}
