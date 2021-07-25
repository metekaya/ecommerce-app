import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, this.index}) : super(key: key);
  final int? index;
  List<Map<String, String>> categories = [
    {
      'categoryName': 'Tasarımlar',
      'categoryImagesPath': 'images/designs.jpg',
    },
    {
      'categoryName': 'Abonelikler',
      'categoryImagesPath': 'images/subscriptions.jpg',
    },
    {
      'categoryName': 'Yazılımlar',
      'categoryImagesPath': 'images/softwares.png',
    },
    {
      'categoryName': 'Entegrasyon',
      'categoryImagesPath': 'images/integrations.jpg',
    },
    {
      'categoryName': 'Çözümler',
      'categoryImagesPath': 'images/solutions.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                categories[index!]['categoryImagesPath']!,
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            color: Colors.transparent,
            child: Text(
              categories[index!]['categoryName']!,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
