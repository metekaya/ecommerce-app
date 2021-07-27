import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';

import 'package:ionicons/ionicons.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.flaticon.com/icons/png/512/3967/3967606.png'),
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
                        Ionicons.star_outline,
                        color: Colors.yellow,
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
                        '₺59.9',
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
                      ('1 Yıllık Park Planı'),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '1 Yıl Boyunca Ücretsiz Park',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.orange,
                            hoverColor: Colors.orange,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Icon(Ionicons.bag_add_outline),
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
