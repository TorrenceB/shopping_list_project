import 'package:flutter/material.dart';

class ItemModel {
  String groceryItem;
  double amount;
  bool isSelected = false;
  bool isEditing = false;

  ItemModel(
      {this.groceryItem, this.amount, this.isSelected = false, this.isEditing});

  String toString() => '''

  groceryItem: $groceryItem,
  amount: $amount,
  isSelected: $isSelected,
  isEditing: $isEditing,

  ''';
}
