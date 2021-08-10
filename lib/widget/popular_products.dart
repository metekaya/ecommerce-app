import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/models/product.dart';
import 'package:intern_app/provider/cart_provider.dart';
import 'package:intern_app/screens/product_details.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String desc;
  // final double price;

  // const PopularProducts(
  //     {Key? key,
  //     required this.imageUrl,
  //     required this.title,
  //     required this.desc,
  //     required this.price})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 260,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        // color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            ProductDetailsScreen.routeName,
            arguments: productsAttributes.id,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(productsAttributes.imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 7,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(28),
                      hoverColor: Colors.yellow.shade50,
                      splashColor: Colors.yellow.shade50,
                      child: Icon(
                        Ionicons.heart_outline,
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 160,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context).backgroundColor,
                      child: Text(
                        '₺${productsAttributes.price}',
                        style: TextStyle(
                          color: MyColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsAttributes.title,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text(
                            productsAttributes.desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.orange,
                            hoverColor: Colors.orange,
                            onTap: () => cartProvider.addProductToCart(
                              productsAttributes.id,
                              productsAttributes.price,
                              productsAttributes.title,
                              productsAttributes.imageUrl,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                cartProvider.getCartItems
                                        .containsKey(productsAttributes.id)
                                    ? Ionicons.checkmark_done_outline
                                    : Ionicons.bag_add_outline,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
