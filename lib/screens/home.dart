import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:intern_app/widget/category.dart';
import 'package:intern_app/widget/popular_products.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _carouselItems = [
      'https://lh3.googleusercontent.com/proxy/mYxSYu8kJULBWEdwyfpSTt89DkyW_FrWGW4RqtsXOvZKTY-huZk4wUeyy2v6tY_ER2_9DcNpLl45VhDH10seHIgT4FzH9w',
      'https://media.istockphoto.com/vectors/parking-lot-with-two-cars-on-city-background-vector-id1151016425?k=6&m=1151016425&s=612x612&w=0&h=jMdRBZulzerQgNhzsuZlmXNek6v4d_sOQpHk8yN55eI=',
      'https://wwwi.globalpiyasa.com/lib/Urun/670/25c91b269169f3159e5e2056b87f6530_1.jpg',
      'https://i.pinimg.com/originals/35/a3/01/35a301ff7eedf9a1277fe6d2d26ef02d.jpg',
    ];
    List _membershipItems = [
      'https://media.istockphoto.com/photos/premium-membership-gold-badge-picture-id530649463?k=6&m=530649463&s=170667a&w=0&h=CgsOLtH70dsBvDMBr8ZEPzBQ1qRP0VyrOcyADIKu6oo=',
      'https://wwwi.globalpiyasa.com/lib/Urun/670/bfdf3549f5ecdc4fb868dcbe75873656.jpg',
      'https://wwwi.globalpiyasa.com/lib/Urun/670/25c91b269169f3159e5e2056b87f6530_1.jpg',
      'https://static.wixstatic.com/media/6ab01d_363d7db5a3394168ba9cac1a6a53f0d1.png/v1/fit/w_500,h_500,q_90/file.png',
    ];
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).backgroundColor,
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
          frontLayer: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Carousel(
                    images: [
                      new Image.network(
                        _carouselItems[0],
                      ),
                      new Image.network(
                        _carouselItems[1],
                        fit: BoxFit.fill,
                      ),
                      new Image.asset(
                        '/images/carousel3.jpg',
                        fit: BoxFit.fill,
                      ),
                      new Image.asset(
                        '/images/carousel4.jpg',
                        fit: BoxFit.fill,
                      ),
                    ],
                    dotSize: 4.0,
                    dotIncreasedColor: MyColors.accentColor,
                    dotSpacing: 15.0,
                    dotColor: MyColors.mainColor,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.grey.withOpacity(0.6),
                    borderRadius: true,
                    animationCurve: Curves.bounceOut,
                    animationDuration: Duration(milliseconds: 600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kategoriler',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryWidget(
                        index: index,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Popüler Abonelikler',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Devamını gör...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Swiper(
                    layout: SwiperLayout.DEFAULT,
                    itemCount: _membershipItems.length,
                    viewportFraction: 0.65,
                    scale: 0.8,
                    autoplay: true,
                    curve: Curves.decelerate,
                    duration: 1000,
                    onTap: (index) {},
                    itemBuilder: (BuildContext ctx, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.grey.withOpacity(0.2),
                          child: Image.network(
                            _membershipItems[index],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Popüler Ürünler',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Devamını gör...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 285,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext ctx, int index) {
                      return PopularProducts();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
