import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailAdress.toLowerCase().trim(),
            password: _password.trim());
      } catch (error) {
        showErrorDialog('Bir Hata Oluştu', '$error');
        print('an error occured $error');
      }
    }
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
    });
    Navigator.pop(context);
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
            Positioned(
              top: 10,
              left: 10,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: MyColors.mainColor,
                  hoverColor: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      Ionicons.chevron_back,
                      color: Theme.of(context).cardColor,
                    ),
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
                          backgroundColor: MyColors.mediumGrey,
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
                                title: Text(
                                  'Seçenekler',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.mainColor),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      InkWell(
                                        onTap: _pickImageCamera,
                                        splashColor: MyColors.accentColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Ionicons.camera_outline,
                                                color: MyColors.mainColor,
                                              ),
                                            ),
                                            Text(
                                              'Kamera',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.mainColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _pickImageGallery,
                                        splashColor: MyColors.mainColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Ionicons.image_outline,
                                                color: MyColors.mainColor,
                                              ),
                                            ),
                                            Text(
                                              'Galeriden Seç',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.mainColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: _removeImage,
                                        splashColor: MyColors.accentColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Ionicons.trash_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text(
                                              'Sil',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ),
                                      ),
                                      // children: [
                                      //   cameraListItems(
                                      //       _pickImageCamera,
                                      //       'Kamera',
                                      //       Ionicons.camera_outline,
                                      //       Colors.green,
                                      //       Colors.black),
                                      //   cameraListItems(
                                      //     _pickImageGallery,
                                      //     'Galeriden Seç',
                                      //     Ionicons.image_outline,
                                      //     Colors.green,
                                      //     Colors.black,
                                      //   ),
                                      //   cameraListItems(
                                      //     _removeImage,
                                      //     'Sil',
                                      //     Ionicons.trash_outline,
                                      //     Colors.red,
                                      //     Colors.red,
                                      //   ),
                                      // ],
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

  Future<void> showErrorDialog(String mainTitle, String subTitle) async {
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
              height: 300,
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mainTitle,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Tamam',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
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

  Widget cameraListItems(
      Function fct, String title, IconData icon, Color color, Color textColor) {
    return InkWell(
      onTap: fct(),
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
