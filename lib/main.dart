import 'package:flutter/material.dart';
import 'package:shopping_list_project/ui/shopping_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildMaterialApp(),
    );
  }
}

MaterialApp _buildMaterialApp() {
  return MaterialApp(
    routes: {
      '/' : (BuildContext context) => ShoppingListView(),
    },
  );
}
