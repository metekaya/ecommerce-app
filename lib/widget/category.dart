import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key, this.index}) : super(key: key);
  final int? index;
  List<Map<String, String>> categories = [
    {
      'categoryName': 'Tasarımlar',
      'categoryImagesPath': 'https://i.imgur.com/mIxPMdF.jpg',
    },
    {
      'categoryName': 'Abonelikler',
      'categoryImagesPath':
          'https://i.pinimg.com/originals/11/7e/70/117e70dba431f4426259f2346196ce22.jpg',
    },
    {
      'categoryName': 'Yazılımlar',
      'categoryImagesPath':
          'https://media.istockphoto.com/vectors/working-at-home-vector-flat-style-illustration-online-career-space-vector-id1241710244?k=6&m=1241710244&s=612x612&w=0&h=39pT_Gl0JD8cE9G6HGMpRP-LvtuXxdTikyU37dOc-7Y=',
    },
    {
      'categoryName': 'Entegrasyon',
      'categoryImagesPath':
          'https://st2.depositphotos.com/2745455/6627/v/600/depositphotos_66273141-stock-illustration-concept-banner-of-team-work.jpg',
    },
    {
      'categoryName': 'Çözümler',
      'categoryImagesPath':
          'https://media.istockphoto.com/vectors/tangle-tangled-and-unraveled-abstract-metaphor-vector-id1180554313?k=6&m=1180554313&s=612x612&w=0&h=w2TR1eye-Kj0p76zajTiV9H90XmOOBYDphrkVbQwwC4=',
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
              image: NetworkImage(
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
