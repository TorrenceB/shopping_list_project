import 'package:flutter/material.dart';

class ItemModel {
  final String groceryItem;
  final double amount;

  ItemModel({this.groceryItem, this.amount});

  String toString() => '''

  groceryItem: $groceryItem,
  amount: $amount,

  ''';
}
