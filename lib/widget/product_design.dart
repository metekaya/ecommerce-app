import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/products.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ProductDesign extends StatelessWidget {
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
  // int _selectedImage = 0;
  // List _productImages = [
  //   'images/ps5-console1.png',
  //   'images/ps5-console2.png',
  //   'images/ps5-console3.png',
  // ];

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final prId = ModalRoute.of(context);
    if (prId == null) return SizedBox.shrink();
    final productId = prId.settings.arguments as String;
    final prodAttr = productsData.findById(productId);

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
                child: Image.network(prodAttr.imageUrl),
              ),
            ),
          ),
          RoundedContainer(
            color: Theme.of(context).buttonColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    prodAttr.title,
                    style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                  child: Text(
                    '₺${prodAttr.price}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyColors.accentColor),
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
                ProductInfoRow(
                  'Marka: ',
                  prodAttr.brand,
                  Theme.of(context).textSelectionColor,
                ),
                ProductInfoRow(
                  'Kategori: ',
                  prodAttr.productCategoryName,
                  Theme.of(context).textSelectionColor,
                ),
                ProductInfoRow(
                  'Stok: ',
                  '${prodAttr.quantity.toString()} adet kaldı.',
                  Theme.of(context).textSelectionColor,
                ),
                ProductInfoRow(
                  'Popülerlik: ',
                  prodAttr.isPopular ? 'En çok ziyaret edilen.' : 'Popüler',
                  Theme.of(context).textSelectionColor,
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      prodAttr.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15),
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
}

Widget ProductInfoRow(String title, String titleDesc, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          titleDesc,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    ),
  );
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
