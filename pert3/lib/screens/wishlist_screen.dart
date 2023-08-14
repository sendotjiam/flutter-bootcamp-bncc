import 'package:flutter/material.dart';
import 'package:pert3/main.dart';
import 'package:pert3/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  final provider = WishlistProvider();

  WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget.provider,
      child: Consumer<WishlistProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: const Text("Wishlist Page"),
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: wishlists.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.teal,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(wishlists[index].title),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(wishlists[index].description),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Rp${wishlists[index].price}"),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          // 1. state management
                          // setState(() {
                          //   wishlists.removeAt(index);
                          // });

                          // 2. provider consumer
                          widget.provider.deleteWishlist(index);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
