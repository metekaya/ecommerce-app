import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://media.istockphoto.com/photos/out-of-focus-office-open-corridor-background-picture-id472336288?k=6&m=472336288&s=612x612&w=0&h=3mqk3KJ7eOzXZfr-LlBMsr4EWd7-WpMzh3Xy2UY6niQ=',
            placeholder: (context, url) => Image.network(
              'https://st2.depositphotos.com/1407534/8617/i/600/depositphotos_86172184-stock-photo-blurred-office-background-office-worker.jpg',
              fit: BoxFit.contain,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'welcome',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Welcome to the biggest store online',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ); //https://p4.wallpaperbetter.com/wallpaper/93/256/35/5bd058d572fd4-wallpaper-preview.jpg
    // https://c4.wallpaperflare.com/wallpaper/1020/206/477/blur-car-lights-cars-celebration-wallpaper-preview.jpg
  }
}
