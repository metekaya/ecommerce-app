import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:intern_app/screens/login.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  String _emailAdress = '';
  String _password = '';
  String _fullName = '';
  late int _phoneNumber;
  File? _pickedImage;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: RotatedBox(
                quarterTurns: 2,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [
                        MyColors.homeGradientStart,
                        MyColors.gradientLStart,
                      ],
                      [
                        MyColors.homeGradientEnd,
                        MyColors.gradientendLEnd,
                      ]
                    ],
                    durations: [19440, 10800],
                    heightPercentages: [0.20, 0.20],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  size: Size(
                    double.infinity,
                    double.infinity,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: MyColors.accentColor,
                        child: CircleAvatar(
                          radius: 69,
                          backgroundImage: _pickedImage == null
                              ? null
                              : FileImage(_pickedImage!),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 110,
                      child: RawMaterialButton(
                        elevation: 10,
                        fillColor: MyColors.accentColor,
                        child: Icon(
                          Ionicons.camera_outline,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Seçenekler',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.mainColor,
                                    ),
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      cameraListItems(
                                          'Kamera',
                                          Ionicons.camera_outline,
                                          Colors.green,
                                          Colors.black),
                                      cameraListItems(
                                        'Galeriden Seç',
                                        Ionicons.image_outline,
                                        Colors.green,
                                        Colors.black,
                                      ),
                                      cameraListItems(
                                        'Sil',
                                        Ionicons.trash_outline,
                                        Colors.red,
                                        Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'İsim alanı boş bırakılamaz';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(
                              Ionicons.person_outline,
                            ),
                            labelText: 'İsim',
                            fillColor: Theme.of(context).backgroundColor,
                          ),
                          onSaved: (value) {
                            _fullName = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('email'),
                          focusNode: _emailFocusNode,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Lütfen geçerli bir e-posta adresi giriniz.';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(
                              Ionicons.mail_outline,
                            ),
                            labelText: 'E Posta Adresi',
                            fillColor: Theme.of(context).backgroundColor,
                          ),
                          onSaved: (value) {
                            _emailAdress = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Lütfen geçerli bir şifre giriniz';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(Ionicons.key_outline),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelText: 'Şifre',
                            fillColor: Theme.of(context).backgroundColor,
                          ),
                          onSaved: (value) {
                            _password = value!;
                          },
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_phoneNumberFocusNode),
                          obscureText: _obscureText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('phone number'),
                          focusNode: _phoneNumberFocusNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen geçerli bir telefon numarası giriniz';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: _submitForm,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            filled: true,
                            prefixIcon: Icon(
                              Ionicons.call_outline,
                            ),
                            labelText: 'Telefon Numarası',
                            fillColor: Theme.of(context).backgroundColor,
                          ),
                          onSaved: (value) {
                            _phoneNumber = int.parse(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(150, 35)),
                        backgroundColor: MaterialStateProperty.all(
                          MyColors.accentColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: MyColors.accentColor,
                            ),
                          ),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Zaten bir hesabın var mı?'),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, LoginScreen.routeName),
                      child: Text(
                        'Hemen Giriş Yap',
                        style: TextStyle(
                          color: MyColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cameraListItems(
      String title, IconData icon, Color color, Color textColor) {
    return InkWell(
      onTap: () {},
      splashColor: MyColors.gradientFEnd,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
