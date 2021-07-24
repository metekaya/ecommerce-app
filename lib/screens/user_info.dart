import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/provider/dark_theme_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  var top = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
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
                                        image: NetworkImage(
                                            'https://image.flaticon.com/icons/png/512/17/17004.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Misafir',
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
                          image: NetworkImage(
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
                      child: screenTitle('Kullanıcı Detayları', 23),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('E Posta', 'metekaya55@gmail.com',
                        Ionicons.mail_outline, context),
                    userListTile('Telefon', '+90 543 389 63 77',
                        Ionicons.call_outline, context),
                    userListTile('Teslimat Adresi', 'Meydan Mah. Laleli Sok.',
                        Icons.local_shipping_outlined, context),
                    userListTile('Katılma Tarihi', '13.07.2021',
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
                    userListTile(
                        'Çıkış yap', 'Çıkış', Ionicons.exit_outline, context),
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

  Widget _buildFab() {
    // fab pozisyonunu başlatıyoruz
    final double defaultTopMargin = 310.0 - 6.0;
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
