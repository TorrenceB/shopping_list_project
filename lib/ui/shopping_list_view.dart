import 'package:flutter/material.dart';
import 'package:shopping_list_project/components/new_item.dart';
import 'package:shopping_list_project/models/item_model.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  static List<ItemModel> _userItems = [];
  static var sum = 0.0;

  //Method to add new item
  void _addNewItem(String item, double itemAmount) {
    final newItem = ItemModel(
      amount: itemAmount,
      groceryItem: item,
    );

    setState(() {
      _userItems.add(newItem);
    });
    print(_userItems);
    _addTotalCost();
  }

  //Initiate bottom modal sheet
  void _startAddNewItem(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewItem(_addNewItem),
        );
      },
    );
  }

  // Method to add total
  void _addTotalCost() {
    double tempSum = 0.0;
    for (var i = 0; i < _userItems.length; i++) {
      tempSum += _userItems[i].amount;
    }
    setState(() {
      sum = tempSum;
    });
  }

//Method to get current state
  void _handleEdit(int index) {
    final updatedItem = ItemModel(
      amount: _userItems[index].amount,
      groceryItem: _userItems[index].groceryItem,
      isEditing: true,
    );

    setState(() {
      _userItems[index] = updatedItem;
    });
    print(updatedItem);
  }

  void _handleUpdate() {
    
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
          : Column(
              children: <Widget>[
                Expanded(
                  child: _buildItemTile(),
                ),
                _buildTotalCard(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewItem(context);
        },
      ),
    );
  }

  ListView _buildItemTile() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _handleEdit(index);
          },
          child: Container(
            padding: EdgeInsets.all(3.0),
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
                trailing:
                    Text('\$${_userItems[index].amount.toStringAsFixed(2)}'),
              ),
            ),
          ),
        );
      },
      itemCount: _userItems.length,
    );
  }

  Row _buildTotalCard() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '\$${sum.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 35.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
