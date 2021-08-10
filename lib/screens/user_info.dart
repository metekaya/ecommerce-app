import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:intern_app/screens/cart.dart';
import 'package:intern_app/screens/wishlist.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  static const routeName = '/UserInfoScreen';
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  var top = 0.0;
  late ScrollController _scrollController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid;
  String? _name;
  String? _imageUrl;
  String? _email;
  String? _joinedAt;
  int? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    getData();
  }

  void getData() async {
    User user = _auth.currentUser!;
    _uid = user.uid;

    final DocumentSnapshot userDoc;
    if (user.isAnonymous) {
      return null;
    } else {
      userDoc =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      setState(() {
        _name = userDoc.get('name');
        _joinedAt = userDoc.get('joinedAt');
        _email = userDoc.get('email');
        _joinedAt = userDoc.get('joinedAt');
        _phoneNumber = userDoc.get('phoneNumber');
        _imageUrl = userDoc.get('imageUrl');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                elevation: 10,
                expandedHeight: 300, //profil foto yüksekliği
                pinned: true, //kayan app bar sabit kalsın mı
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MyColors.starterColor,
                            MyColors.endColor2,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: FlexibleSpaceBar(
                        //aşağı çekerkenki yok olma animasyonu
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity: top <= 110
                                  ? 1.0
                                  : 0, // sliverappbar ortaya çıkış süresi, yüksek değer çabuk çıkarıyor.
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: MyColors.mainColor,
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: NetworkImage(_imageUrl ??
                                            'https://image.flaticon.com/icons/png/512/17/17004.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    _name ?? 'Misafir',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(_imageUrl ??
                              'https://image.flaticon.com/icons/png/512/17/17004.png'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                //Sliver'in alt kısmındaki widgetlar
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: screenTitle('Kullanıcı Sepeti', 23),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            WishlistScreen.routeName,
                          ),
                          title: Text(
                            'İstek Listem',
                            style: TextStyle(color: MyColors.favColor),
                          ),
                          leading: Icon(
                            Ionicons.heart_circle_outline,
                            color: MyColors.favColor,
                          ),
                          trailing: Icon(
                            Ionicons.chevron_forward_outline,
                            color: MyColors.favColor,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            CartScreen.routeName,
                          ),
                          title: Text(
                            'Sepetim',
                            style: TextStyle(color: MyColors.mainColor),
                          ),
                          leading: Icon(
                            Ionicons.cart_outline,
                            color: MyColors.mainColor,
                          ),
                          trailing: Icon(
                            Ionicons.chevron_forward_outline,
                            color: MyColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: screenTitle('Kullanıcı Detayları', 23),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('E Posta', _email ?? '', Ionicons.mail_outline,
                        context),
                    userListTile(
                        'Telefon',
                        _phoneNumber == null ? '' : _phoneNumber.toString(),
                        Ionicons.call_outline,
                        context),
                    userListTile('Teslimat Adresi', 'Meydan Mah. Laleli Sok.',
                        Icons.local_shipping_outlined, context),
                    userListTile('Katılma Tarihi', _joinedAt ?? '',
                        Ionicons.time_outline, context),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: screenTitle('Kullanıcı Ayarları', 23),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTileSwitch(
                      value: themeChange.darkTheme,
                      leading: Icon(Ionicons.moon_outline),
                      onChanged: (value) {
                        setState(() {
                          themeChange.darkTheme = value;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: MyColors.mainColor,
                      title: Text('Koyu Tema (WIP)'),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () {
                            showErrorDialog(
                                'Çıkış yapmak istediğinize emin misiniz?');
                          },
                          title: Text('Çıkış Yap'),
                          leading: Icon(Ionicons.log_out_outline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Future<void> showErrorDialog(String mainTitle) async {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Ionicons.alert_circle_outline,
                        size: 50,
                        color: Colors.red,
                      ),
                      Text(
                        mainTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).textSelectionColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'İptal Et',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _auth.signOut();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Çıkış Yap',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).buttonColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Widget _buildFab() {
    // fab pozisyonunu başlatıyoruz
    final double defaultTopMargin = 285.0 - 6.0;
    // yeniden boyutlandırmadaki yukarıdan çizilecek pixellerin başlaması gereken nokta
    final double scaleStart = 200.0;
    // yeniden boyutlandırmadaki yukarıdan çizilecek pixellerin bitmesi gereken nokta
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 2.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          hoverColor: MyColors.secondaryColor,
          backgroundColor: MyColors.mainColor,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Ionicons.camera_outline),
        ),
      ),
    );
  }

  Widget userListTile(
      String title, String subtitle, IconData icon, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(icon),
        ),
      ),
    );
  }
}

Widget screenTitle(String title, double fontSize) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}
