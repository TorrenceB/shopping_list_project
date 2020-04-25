import 'package:flutter/material.dart';
import 'package:shopping_list_project/models/item_model.dart';

class NewItem extends StatefulWidget {
  final Function addNewItm;
  final Function editItm;
  final bool displayModal;

  NewItem({this.addNewItm, this.editItm, this.displayModal = false});

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  TextEditingController itemController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  void initState() {
    super.initState();
    itemController.addListener(_currentItmText);
    // amtController.addListener(_currentAmtValue);
  }

  void _currentItmText() {
    print('Current item value: ${itemController.text}');
  }

  // void _currentAmtValue() {
  //   print('Current amount value: ${double.tryParse(amtController.text)}');
  // }

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

  void editData() {
    String enteredItem = itemController.text;

    ItemModel updatedItem = ItemModel(
      groceryItem: enteredItem,
    );

    widget.editItm(updatedItem);
    print(updatedItem);
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
    // double enteredAmt = double.tryParse(amtController.text);

    return Column(
      children: <Widget>[
        TextField(
          controller: itemController,
          decoration: InputDecoration(labelText: 'Item'),
          onSubmitted: (_) => editData(),
        ),
        // TextField(
        //   controller: amtController,
        //   decoration: InputDecoration(labelText: 'Amount'),
        //   onSubmitted: () =>
        // ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            padding: EdgeInsets.all(15.0),
            child: Text('Edit item'),
            onPressed: editData,
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
