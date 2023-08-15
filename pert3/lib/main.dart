import 'package:flutter/material.dart';
import 'package:pert3/models/item_model.dart';
import 'package:pert3/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

List<ItemModel> itemList = [
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci piring", 10000),
  ItemModel("Sabun", "Buat mandi", 10000),
  ItemModel("Sabun", "Cuci", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
  ItemModel("Sabun", "Cuci muka", 10000),
];

List<ItemModel> wishlists = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
