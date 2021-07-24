import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          headerHeight: MediaQuery.of(context).size.height * 0.35,
          appBar: BackdropAppBar(
            title: Text("Ana Sayfa"),
            leading: BackdropToggleButton(
              icon: AnimatedIcons.arrow_menu,
            ),
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
            actions: [
              IconButton(
                splashRadius: 30,
                iconSize: 15,
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage(
                      'https://image.flaticon.com/icons/png/512/17/17004.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          backLayer: Center(
            child: Text("Back Layer"),
          ),
          frontLayer: SizedBox(
            height: 200.0,
            width: 350.0,
            child: Carousel(
              images: [
                new Image.network(
                    'https://image.flaticon.com/icons/png/512/17/17004.png'),
                new Image.network(
                    'https://image.flaticon.com/icons/png/512/17/17004.png'),
                new Image.network(
                    'https://image.flaticon.com/icons/png/512/17/17004.png'),
                new Image.network(
                    'https://image.flaticon.com/icons/png/512/17/17004.png'),
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.purple.withOpacity(0.5),
              borderRadius: true,
            ),
          ),
        ),
      ),
    );
  }
}
