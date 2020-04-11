import 'package:flutter/material.dart';
import 'package:shopping_list_project/components/new_item.dart';
import 'package:shopping_list_project/models/item_model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  final List<ItemModel> _userItems = [
    ItemModel(
      isChecked: false,
      amount: 5.69,
      groceryItem: 'Frozen chicken',
    ),
    ItemModel(
      isChecked: false,
      amount: 5.69,
      groceryItem: 'Frozen chicken',
    ),
  ];

  //Method to add new item
  void _addNewItem(String item, double itemAmount) {
    return null;
  }

  //Initiate bottom modal sheet
  void _startAddNewItem() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping list'),
      ),
      body: _userItems.length == 0
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
                _userItems,
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Add new item');
        },
      ),
    );
  }
}
