import 'package:flutter/material.dart';

class ItemModel {
  String groceryItem;
  double amount;
  bool isSelected = false;

  ItemModel({
    this.groceryItem,
    this.amount,
    this.isSelected = false,
  });

  String toString() => '''

  groceryItem: $groceryItem,
  amount: $amount,
  isSelected: $isSelected,

  ''';
}
