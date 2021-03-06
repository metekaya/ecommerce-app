import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/cart_provider.dart';
import 'package:intern_app/widget/cart_full.dart';
import 'package:intern_app/widget/empty_cart.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            bottomSheet: checkOutSection(context),
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColors.homeGradientStart,
                      MyColors.homeGradientEnd,
                    ],
                  ),
                ),
              ),
              title: Text('Sepetteki Ürünler'),
              actions: [
                IconButton(
                  onPressed: () {
                    cartProvider.clearCart();
                  },
                  icon: Icon(Ionicons.trash_bin_outline),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemCount: cartProvider.getCartItems.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ChangeNotifierProvider.value(
                    value: cartProvider.getCartItems.values.toList()[index],
                    child: CartFull(
                        cartProvider.getCartItems.keys.toList()[index]),
                  );
                },
              ),
            ),
          );
  }

  Widget checkOutSection(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
              'TRY ₺${cartProvider.totalAmount.toString()}',
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
