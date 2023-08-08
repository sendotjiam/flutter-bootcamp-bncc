import 'package:flutter/material.dart';

class Model {
  String name;
  int age;

  // Model(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // Standard constructor
  Model(this.name, this.age);

  // Named constructor
  Model.withNameJohn(this.name, this.age);
  Model.withEmpty({this.name = "", required this.age});

  // Factory constructor
  factory Model.factory(String name, int age) {
    return Model(name, age);
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            child: Text("Go Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
