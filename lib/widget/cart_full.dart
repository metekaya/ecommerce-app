import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('/images/3d-printer.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'BenMaker Ekser 3D Yazıcı',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {},
                        highlightColor: Colors.red.shade200,
                        hoverColor: Colors.red.shade200,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Ionicons.close_outline,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Fiyat: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            themeChange.darkTheme ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '₺9500',
                      style: TextStyle(
                        fontSize: 15,
                        color: MyColors.accentColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Ara Toplam: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color:
                            themeChange.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      '₺9500',
                      style: TextStyle(
                        fontSize: 15,
                        color: MyColors.accentColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Kargo Ücretsiz',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.accentColor,
                      ),
                    ),
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(11),
                        onTap: () {},
                        highlightColor: Colors.red.shade200,
                        hoverColor: Colors.red.shade200,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(
                              Ionicons.remove_circle_outline,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
                      color: MyColors.mainColor,
                      elevation: 10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              MyColors.gradientLStart,
                              MyColors.gradientendLEnd
                            ],
                            stops: [
                              0.0,
                              0.7,
                            ],
                          ),
                        ),
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(11),
                        onTap: () {},
                        highlightColor: Colors.green.shade200,
                        hoverColor: Colors.green.shade200,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(
                              Ionicons.add_circle_outline,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
