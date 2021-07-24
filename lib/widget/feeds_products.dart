import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/main.dart';
import 'package:ionicons/ionicons.dart';

class FeedsProducts extends StatefulWidget {
  @override
  _FeedsProductsState createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width * 0.47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: MediaQuery.of(context).size.height * 0.27,
                  ),
                  child: Image(
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/premium-membership-gold-badge-picture-id530649463?k=6&m=530649463&s=170667a&w=0&h=CgsOLtH70dsBvDMBr8ZEPzBQ1qRP0VyrOcyADIKu6oo='),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Badge(
                animationDuration: Duration(milliseconds: 700),
                animationType: BadgeAnimationType.scale,
                toAnimate: true,
                shape: BadgeShape.square,
                badgeColor: MyColors.accentColor,
                borderRadius: BorderRadius.circular(8),
                badgeContent: Text(
                  'YENİ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(
              left: 5,
              bottom: 5,
              right: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Premium Otopark Üyeliği',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '₺159',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adet: Sınırsız',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(18),
                        splashColor: MyColors.mainColor,
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}