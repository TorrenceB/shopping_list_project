import 'package:flutter/material.dart';
import 'package:shopping_list_project/components/new_item.dart';
import 'package:shopping_list_project/models/item_model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  final List<ItemModel> _userItems = [];

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
                      leading: Checkbox(
                        value: _userItems[index].isSelected,
                        onChanged: (bool val) {
                          setState(() {
                            _userItems[index].isSelected = val;
                          });
                        },
                      ),
                      title: Center(
                        child: Text(_userItems[index].groceryItem),
                      ),
                      trailing: Text('\$${_userItems[index].amount.toStringAsFixed(2)}'),
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
