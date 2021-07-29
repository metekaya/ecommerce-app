import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/products.dart';
import 'package:intern_app/widget/product_design.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: checkOutSection(context),
      body: Container(
        margin: EdgeInsets.only(bottom: 80),
        child: ProductDesign(),
      ),
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
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
        title: Text(
          'Ürün Ekranı',
          style: TextStyle(
            color: Theme.of(context).textSelectionColor,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: AppbarIconButton(
            iconData: Icons.arrow_back_ios,
            press: () => Navigator.of(context).pop(context),
          ),
        ),
      ),
    );
  }

  Widget checkOutSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            checkOutButton(
                context, 'Sepete Ekle', Colors.red, Colors.red.shade200),
            Spacer(),
            checkOutButton(
                context, 'Satın Al', MyColors.mainColor, MyColors.gradientFEnd),
          ],
        ),
      ),
    );
  }

  Widget checkOutButton(
      BuildContext context, String title, Color color, Color splashColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({
    Key? key,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.black,
        ),
        onPressed: press,
        child: Icon(iconData),
      ),
    );
  }
}
