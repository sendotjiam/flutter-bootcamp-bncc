import 'package:flutter/material.dart';
import 'package:pert3/main.dart';

class WishlistProvider extends ChangeNotifier {
  // List<ItemModel> _wishlists = [];

  // List<ItemModel> get wishlists {
  //   return _wishlists;
  // }

  // set wishlists(ItemModel item) {
  //   _wishlists.add(item);
  // }

  deleteWishlist(int index) {
    wishlists.removeAt(index);
    notifyListeners();
  }
}
