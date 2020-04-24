import 'package:flutter/material.dart';
import 'package:shopping_list_project/models/item_model.dart';

class NewItem extends StatefulWidget {
  final Function addNewItm;
  final bool displayModal;

  NewItem(this.addNewItm, {this.displayModal = false});

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  TextEditingController itemController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  void submitData() {
    String enteredItem = itemController.text;
    double enteredAmount = double.tryParse(amtController.text) ?? 0.0;

    if (enteredItem.isEmpty) {
      return;
    }

    widget.addNewItm(
      enteredItem,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(35.0),
        child: widget.displayModal ? _buildEditItem() : _buildAddNewItem(),
      ),
    );
  }

  Column _buildEditItem() {
    return Column(
      children: <Widget>[
        TextField(
          controller: itemController,
          decoration: InputDecoration(labelText: 'Item'),
          onSubmitted: null,
        ),
        TextField(
          controller: amtController,
          decoration: InputDecoration(labelText: 'Amount'),
          onSubmitted: null,
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            padding: EdgeInsets.all(15.0),
            child: Text('Edit item'),
            onPressed: null,
          ),
        ),
      ],
    );
  }

  Column _buildAddNewItem() {
    return Column(
      children: <Widget>[
        TextField(
          controller: itemController,
          decoration: InputDecoration(labelText: 'Item'),
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          controller: amtController,
          decoration: InputDecoration(labelText: 'Amount'),
          onSubmitted: (_) => submitData(),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            padding: EdgeInsets.all(15.0),
            child: Text('Add item'),
            onPressed: submitData,
          ),
        ),
      ],
    );
  }
}
