import 'package:flutter/material.dart';
import 'package:intern_app/consts/dark_theme_colors.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:intern_app/screens/bottom_bar.dart';
import 'package:intern_app/screens/cart.dart';
import 'package:intern_app/screens/feeds.dart';
import 'package:intern_app/screens/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Intern App',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            routes: {
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
            },
          );
        },
      ),
    );
  }
}
