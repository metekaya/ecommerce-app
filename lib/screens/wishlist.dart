import 'package:flutter/material.dart';

import 'package:intern_app/widget/cart_full.dart';
import 'package:intern_app/widget/empty_cart.dart';
import 'package:intern_app/widget/empty_wishlist.dart';
import 'package:intern_app/widget/wishlist_full.dart';
import 'package:ionicons/ionicons.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    List wishlistItems = [];
    return Scaffold(
      body: !wishlistItems.isEmpty
          ? Scaffold(
              body: EmptyWishlist(),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('İstek Listem'),
              ),
              body: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int index) {
                    return WishlistFull();
                  }),
            ),
    );
  }
}
