import 'package:flutter/material.dart';
import 'package:pert3/main.dart';
import 'package:pert3/models/item_model.dart';
import 'package:pert3/screens/wishlist_screen.dart';

class HomeScreen extends StatelessWidget {
  final _data = [
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

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ),
              );
            },
            icon: const Icon(Icons.heart_broken),
          ),
        ],
      ),
      body: SafeArea(
        // LayoutBuilder(
        //   builder: (context, constraints) {
        //     // desktop/web
        //     if (constraints.maxWidth < 1290) {

        //     }
        //     // tablet
        //      else if (constraints.maxWidth < 720) {

        //     }
        //     // mobile
        //     else if (constraints.maxWidth < 420) {
        //     }
        //   },
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (!wishlists.contains(_data[index])) {
                  wishlists.add(_data[index]);
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishlistScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.cyan,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_data[index].title),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(_data[index].description),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Rp${_data[index].price}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget _makeResponsiveLayout() {
  //   const width = MediaQuery.of(context).size.width;
  //   const orientation = MediaQuery.of(context).orientation;

  //   if (width < 1290) {
  //     return Container(); //
  //   } else if (width < 720 ) {
  //     return Container();//
  //   } else if (width < 420) {
  //     return ListView();
  //   }
  // }
}
