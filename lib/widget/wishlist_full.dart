import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';

class WishlistFull extends StatefulWidget {
  const WishlistFull({Key? key}) : super(key: key);

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 10,
            right: 30,
            bottom: 10,
            top: 10,
          ),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5),
            elevation: 5,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      child: Image.network(
                        'https://productimages.hepsiburada.net/s/86/375/110000028286524.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Playstation 5',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '₺7800',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: MyColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(),
      ],
    );
  }
}

Widget positionedRemove() {
  return Positioned(
    top: 20,
    right: 15,
    child: Container(
      height: 30,
      width: 30,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        padding: EdgeInsets.all(0),
        color: MyColors.favColor,
        child: Icon(
          Icons.clear,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ),
  );
}
