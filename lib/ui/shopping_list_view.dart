import 'package:flutter/material.dart';
import 'package:shopping_list_project/models/item_model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping list'),
      ),
      body: item == null
          ? Center(
              child: Container(
                child: Text(
                  'No items added yet!',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            )
          : ListView(
              children: <Widget>[
                _buildItemContainer(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Add grocery item');
        },
      ),
    );
  }

  Container _buildItemContainer() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: item.isChecked
              ? Icon(Icons.check_box)
              : Icon(Icons.check_box_outline_blank),
          title: Center(
            child: Text(item.groceryItem),
          ),
          trailing: Text(item.amount.toString()),
        ),
      ),
    );
  }
}
