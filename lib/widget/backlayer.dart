import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/screens/cart.dart';
import 'package:intern_app/screens/feeds.dart';
import 'package:ionicons/ionicons.dart';

class BackLayerMenu extends StatelessWidget {
  const BackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.homeGradientStart, MyColors.homeGradientEnd],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 100,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              width: 150,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: 60,
          child: Transform.rotate(
            angle: -0.6,
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 100,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.flaticon.com/icons/png/512/17/17004.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                backlayerContent(context, () {
                  navigateTo(context, FeedsScreen.routeName);
                }, 'Ürünleri Keşfet', Ionicons.compass_outline),
                backlayerContent(context, () {
                  navigateTo(context, FeedsScreen.routeName);
                }, 'İstek Listem', Ionicons.heart_outline),
                backlayerContent(context, () {
                  navigateTo(context, CartScreen.routeName);
                }, 'Sepetim', Ionicons.bag_outline),
                backlayerContent(context, () {
                  navigateTo(context, FeedsScreen.routeName);
                }, 'Yeni bir ürün ekle', Ionicons.cloud_upload_outline),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  Widget backlayerContent(
      BuildContext context, Function() fct, String title, IconData icon) {
    return InkWell(
      onTap: fct,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(
            icon,
            size: 22,
          ),
        ],
      ),
    );
  }
}
