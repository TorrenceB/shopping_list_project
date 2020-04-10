import 'package:flutter/material.dart';

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping list'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Card(
              child: ListTile(
                leading: Icon(Icons.check_box),
                title: Center(
                  child: Text('Chicken Breast'),
                ),
                trailing: Text('\$ 6.59'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
