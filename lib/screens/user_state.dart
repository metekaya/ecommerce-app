import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/screens/bottom_bar.dart';
import 'package:intern_app/screens/landing_page.dart';

class UserState extends StatelessWidget {
  const UserState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.connectionState == ConnectionState.active) {
            if (userSnapshot.hasData) {
              return BottomBarScreen();
            } else {
              return LandingPage();
            }
          } else if (userSnapshot.hasError) {
            return Center(
              child: Text('Bir hata oluştu'),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
