import 'package:flutter/material.dart';
import 'package:mvvm/models/Product.dart';

class MyProductListItem extends StatefulWidget {

  Product obj;
  VoidCallback deleteClick;
  VoidCallback updateClick;

  MyProductListItem({this.obj,this.deleteClick,this.updateClick});

  @override
  State<MyProductListItem> createState() => _MyProductListItemState();
}

class _MyProductListItemState extends State<MyProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.obj.pname.toString()),
          Text(widget.obj.qty.toString()),
          Text(
            "Rs." + widget.obj.price.toString(),
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: widget.deleteClick,
                style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade800,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text("Delete"),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed:widget.updateClick,
                  child: Text("Update")),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
