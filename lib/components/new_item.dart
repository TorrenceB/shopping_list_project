import 'package:flutter/material.dart';
import 'package:shopping_list_project/models/item_model.dart';

class NewItem extends StatefulWidget {
  final Function addNewItm;

  NewItem(this.addNewItm);

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  TextEditingController itemController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: itemController,
              decoration: InputDecoration(labelText: 'Item'),
            ),
            TextField(
              controller: amtController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Add item'),
                  onPressed: () {
                    print('Add item');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
