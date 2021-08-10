import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/dark_theme_colors.dart';
import 'package:intern_app/provider/cart_provider.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:intern_app/provider/products.dart';
import 'package:intern_app/screens/bottom_bar.dart';
import 'package:intern_app/screens/cart.dart';
import 'package:intern_app/screens/feeds.dart';
import 'package:intern_app/screens/login.dart';
import 'package:intern_app/screens/product_details.dart';
import 'package:intern_app/screens/sign_up.dart';
import 'package:intern_app/screens/upload_product_form.dart';
import 'package:intern_app/screens/user_info.dart';
import 'package:intern_app/screens/user_state.dart';
import 'package:intern_app/screens/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('An error occured'),
                ),
              ),
            );
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) {
                  return themeChangeProvider;
                },
              ),
              ChangeNotifierProvider(
                create: (_) => Products(),
              ),
              ChangeNotifierProvider(
                create: (_) => CartProvider(),
              ),
            ],
            child: Consumer<DarkThemeProvider>(
              builder: (context, themeData, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Intern App',
                  theme:
                      Styles.themeData(themeChangeProvider.darkTheme, context),
                  home: UserState(),
                  routes: {
                    BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                    UserInfoScreen.routeName: (ctx) => UserInfoScreen(),
                    CartScreen.routeName: (ctx) => CartScreen(),
                    LoginScreen.routeName: (ctx) => LoginScreen(),
                    SignUpScreen.routeName: (ctx) => SignUpScreen(),
                    FeedsScreen.routeName: (ctx) => FeedsScreen(),
                    WishlistScreen.routeName: (ctx) => WishlistScreen(),
                    UploadProductForm.routeName: (ctx) => UploadProductForm(),
                    ProductDetailsScreen.routeName: (ctx) =>
                        ProductDetailsScreen(),
                  },
                );
              },
            ),
          );
        });
  }
}
