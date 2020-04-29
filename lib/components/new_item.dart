import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list_project/models/item_model.dart';

class NewItem extends StatefulWidget {
  final Function addNewItm;
  final Function editItm;
  final bool displayModal;
  ItemModel currentItem;

  NewItem(
      {this.addNewItm,
      this.editItm,
      this.displayModal = false,
      this.currentItem});

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  TextEditingController itemController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  void initState() {
    super.initState();
    itemController.addListener(_currentItmText);
    amtController.addListener(_currentAmtValue);
    if (widget.currentItem != null) {
      itemController.text = widget.currentItem.groceryItem;
      amtController.text = '${widget.currentItem.amount.toStringAsFixed(0)}';
    }
  }

  void _currentItmText() {
    print('Current item value: ${itemController.text}');
  }

  void _currentAmtValue() {
    print('Current amount value: ${double.tryParse(amtController.text)}');
  }

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
        color: Colors.white,
        padding: EdgeInsets.all(35.0),
        child: widget.displayModal ? _buildEditItem() : _buildAddNewItem(),
      ),
    );
  }

  Column _buildEditItem() {
    print('Current Item: ${widget.currentItem}');
    return Column(
      children: <Widget>[
        TextField(
          controller: itemController,
          decoration: InputDecoration(
            labelText: 'Item',
            labelStyle: GoogleFonts.bangers(color: Colors.black, fontSize: 20),
          ),
        ),
        TextField(
          controller: amtController,
          decoration: InputDecoration(
            labelText: 'Amount',
            labelStyle: GoogleFonts.bangers(color: Colors.black, fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
              elevation: 6,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Edit item',
                style: GoogleFonts.bangers(fontSize: 17),
              ),
              onPressed: () {
                widget.currentItem.groceryItem = itemController.text;
                widget.currentItem.amount = double.parse(amtController.text);
                widget.editItm(item: widget.currentItem);
              }),
        ),
      ],
    );
  }

  Column _buildAddNewItem() {
    return Column(
      children: <Widget>[
        TextField(
          controller: itemController,
          decoration: InputDecoration(
            labelText: 'Item',
            labelStyle: GoogleFonts.bangers(color: Colors.black, fontSize: 20),
          ),
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          controller: amtController,
          decoration: InputDecoration(
            labelText: 'Amount',
            labelStyle: GoogleFonts.bangers(color: Colors.black, fontSize: 20),
          ),
          onSubmitted: (_) => submitData(),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: RaisedButton(
            elevation: 6,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Add item',
              style: GoogleFonts.bangers(fontSize: 17),
            ),
            onPressed: submitData,
          ),
        ),
      ],
    );
  }
}
