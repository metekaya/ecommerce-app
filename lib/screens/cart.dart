import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/widget/cart_full.dart';
import 'package:intern_app/widget/empty_cart.dart';
import 'package:ionicons/ionicons.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products = [];
    return Scaffold(
      body: products.isEmpty
          ? Scaffold(
              body: EmptyCart(),
            )
          : Scaffold(
              bottomSheet: checkOutSection(context),
              appBar: AppBar(
                title: Text('Sepetteki Ürünler'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Ionicons.trash_bin_outline),
                  ),
                ],
              ),
              body: Container(
                margin: EdgeInsets.only(bottom: 60),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CartFull();
                  },
                ),
              ),
            ),
    );
  }

  Widget checkOutSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey),
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [MyColors.gradientLStart, MyColors.gradientendLEnd],
                  stops: [
                    0.0,
                    0.7,
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ödeme Yap',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Toplam: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'TRY ₺9500',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
