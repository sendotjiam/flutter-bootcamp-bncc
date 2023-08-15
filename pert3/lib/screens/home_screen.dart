import 'package:flutter/material.dart';
import 'package:pert3/components/form_bottom_sheet.dart';
import 'package:pert3/main.dart';
import 'package:pert3/models/item_model.dart';
import 'package:pert3/screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            icon: const Icon(
              Icons.heart_broken,
              color: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ItemModel model = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const FormBottomSheet(),
              );
            },
          );
          setState(() {
            itemList.add(model);
          });
        },
        child: const Icon(Icons.add),
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
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (!wishlists.contains(itemList[index])) {
                  wishlists.add(itemList[index]);
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
                    Text(itemList[index].title),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(itemList[index].description),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Rp${itemList[index].price}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
