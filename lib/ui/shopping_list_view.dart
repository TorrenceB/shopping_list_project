import 'package:flutter/material.dart';
import 'package:shopping_list_project/components/new_item.dart';
import 'package:shopping_list_project/models/item_model.dart';

import 'package:google_fonts/google_fonts.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  static List<ItemModel> _userItems = [];
  static var sum = 0.0;
  bool _isEditing = false;
  ItemModel _currentItemEditing;
  Color primaryTheme = const Color(0xff072A24);
  Color secondaryTheme = const Color(0xff9BCFB8);

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
          child: NewItem(addNewItm: _addNewItem),
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

  void _handleEdit({ItemModel item}) {
    _addTotalCost();

    Navigator.of(context).pop();
  }

  void _startHandleEdit(BuildContext context, ItemModel item) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewItem(
            currentItem: item,
            editItm: _handleEdit,
            displayModal: _isEditing,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryTheme,
        title: Text(
          'Shopping list',
          style: GoogleFonts.bangers(fontSize: 35),
        ),
      ),
      body: _userItems.length == 0
          ? Center(
              child: Container(
                child: Text(
                  'No items added yet!',
                  style: GoogleFonts.bangers(
                    fontSize: 35.0,
                  ),
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
        backgroundColor: primaryTheme,
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
            setState(() {
              _isEditing = true;
              this._currentItemEditing = _userItems[index];
            });
            _startHandleEdit(context, this._currentItemEditing);
          },
          child: Container(
            padding: EdgeInsets.all(3.0),
            child: Card(
              color: secondaryTheme,
              elevation: 6,
              child: ListTile(
                leading: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: primaryTheme,
                    value: _userItems[index].isSelected,
                    onChanged: (bool val) {
                      setState(() {
                        _userItems[index].isSelected = val;
                      });
                    },
                  ),
                ),
                title: Center(
                  child: Text(
                    _userItems[index].groceryItem,
                    style:
                        GoogleFonts.bangers(color: Colors.white, fontSize: 20),
                  ),
                ),
                trailing: Text(
                  '\$${_userItems[index].amount.toStringAsFixed(2)}',
                  style: GoogleFonts.bangers(color: Colors.white, fontSize: 20),
                ),
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
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Total',
                    style: GoogleFonts.bangers(fontSize: 25.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '\$${sum.toStringAsFixed(2)}',
                    style: GoogleFonts.bangers(fontSize: 40.0),
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
