import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intern_app/consts/MyColors.dart';

import 'search.dart';
import 'user_info.dart';
import 'cart.dart';
import 'feeds.dart';
import 'home.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      HomeScreen(),
      FeedsScreen(),
      Navigator.pushNamed(context, FeedsScreen.routeName, arguments: ''),
      CartScreen(),
      UserInfoScreen(),
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5, // notch uzaklığı
        clipBehavior: Clip
            .antiAlias, // notch kısmındaki border'ın görünürlüğü yumuşatıldı
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.3,
              ),
            ),
          ),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: MyColors.mainColor,
            selectedItemColor: MyColors.accentColor,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Ionicons.home_outline),
                tooltip: 'Anasayfa',
                label: 'Anasayfa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.compass_outline),
                tooltip: 'Keşfet',
                label: 'Keşfet',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                tooltip: 'Arama',
                label: 'Arama',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.cart_outline),
                tooltip: 'Sepet',
                label: 'Sepet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person_outline),
                tooltip: 'Kullanıcı',
                label: 'Kullanıcı',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.mainColor,
        tooltip: 'Search',
        elevation: 7,
        hoverColor: MyColors.secondaryColor,
        child: (Icon(Ionicons.search_outline)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
