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
    );
  }
}
