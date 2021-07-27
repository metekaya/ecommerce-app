import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:ionicons/ionicons.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductImages();
  }
}

class ProductImages extends StatefulWidget {
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _selectedImage = 0;
  List _productImages = [
    'images/ps5-console.png',
    'images/ps5-console2.png',
    'images/ps5-console3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(_productImages[_selectedImage]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                _productImages.length,
                (index) => buildSmallPreview(index),
              ),
            ],
          ),
          RoundedContainer(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Playstation 5™ Oyun Konsolu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: 64,
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        highlightColor: Colors.red.shade200,
                        splashColor: Colors.red.shade300,
                        hoverColor: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(
                          Ionicons.heart_outline,
                          color: MyColors.favColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Playstation 5 açıklaması, konsol uygulaması, devam eden satırlar.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: MyColors.favColor,
                        ),
                        child: Text('Daha fazla detay gör'),
                      ),
                    ),
                    Icon(
                      Ionicons.chevron_forward,
                      size: 14,
                      color: MyColors.favColor,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 15, top: 15),
        padding: EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _selectedImage == index ? MyColors.mainColor : Colors.white,
          ),
        ),
        child: Image.asset(_productImages[index]),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: child,
    );
  }
}
