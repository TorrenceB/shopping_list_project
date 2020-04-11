import 'package:flutter/material.dart';
import 'package:shopping_list_project/models/item_model.dart';

class NewItem extends StatefulWidget {
  ItemModel item;

  NewItem(this.item);

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: widget.item.isChecked
              ? Icon(Icons.check_box)
              : Icon(Icons.check_box_outline_blank),
          title: Center(
            child: Text(widget.item.groceryItem),
          ),
          trailing: Text(widget.item.amount.toString()),
        ),
      ),
    );
  }
}