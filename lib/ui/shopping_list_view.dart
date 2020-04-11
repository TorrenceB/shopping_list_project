import 'package:flutter/material.dart';
import 'package:shopping_list_project/components/new_item.dart';
import 'package:shopping_list_project/models/item_model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  final List<ItemModel> _userItems = [
    // ItemModel(
    // isChecked: false,
    // amount: 5.69,
    // groceryItem: 'Frozen chicken',
    // ),
    // ItemModel(
    // isChecked: false,
    // amount: 2.52,
    // groceryItem: 'Banannas',
    // ),
  ];

  //Method to add new item
  void _addNewItem(String item, double itemAmount) {
    final newItem = ItemModel(
      amount: itemAmount,
      groceryItem: item,
    );
    setState(() {
      _userItems.add(newItem);
    });
  }

  //Initiate bottom modal sheet
  void _startAddNewItem(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewItem(_addNewItem),
          );
        });
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
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.check_box),
                      title: Center(
                        child: Text(_userItems[index].groceryItem),
                      ),
                      trailing: Text(_userItems[index].amount.toString()),
                    ),
                  ),
                );
              },
              itemCount: _userItems.length,
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewItem(context);
        },
      ),
    );
  }
}
