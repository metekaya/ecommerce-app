import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width *
              1, //genişlik olarak telefonun bütün boyutunu kapsasın.
          height: MediaQuery.of(context).size.height *
              0.6, // yükseklik olarak yüzde 40'lık alanı kapsasın.
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('https://i.imgur.com/xmMXbn1.png'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Sepetiniz Boş!',
          style: TextStyle(
            color: Theme.of(context).textSelectionColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Görünüşe göre henüz sepetinize \nbir şey eklemediniz.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).textSelectionColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.06,
          child: FloatingActionButton(
            backgroundColor: MyColors.mainColor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                  color: themeChange.darkTheme
                      ? MyColors.secondaryColor
                      : MyColors.mainColor),
            ),
            child: Text(
              'Hemen Ürün Ekle',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
