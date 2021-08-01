import 'package:flutter/material.dart';
import 'package:intern_app/consts/MyColors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  String _emailAdress = '';
  String _password = '';
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
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
      body: Stack(
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
              Container(
                margin: EdgeInsets.only(top: 80),
                height: 120,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/proxy/Z3CCi0NJsCSjOySS3JyBHOo3JvmEcktcEKB2-xAIlmwwlKk10UbeRdh8CTao-zbLGbQuZjQMpQTTzxsxoZavtjTRrOBYOA'),
                      fit: BoxFit.fill),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        key: ValueKey('email'),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Şifreniz doğru değil.';
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
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    labelText: 'Şifre',
                    fillColor: Theme.of(context).backgroundColor,
                  ),
                  onSaved: (value) {
                    _password = value!;
                  },
                  onEditingComplete: _submitForm,
                  obscureText: _obscureText,
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
                      fixedSize: MaterialStateProperty.all<Size>(Size(150, 35)),
                      backgroundColor: MaterialStateProperty.all(
                        MyColors.mainColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: MyColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                    onPressed: _submitForm,
                    child: Text(
                      'Giriş Yap',
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
                height: 100,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                  ),
                  Text(
                    'Veya şununla devam et',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    highlightedBorderColor: Colors.red.shade300,
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.logo_google,
                          size: 16,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Google ',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OutlineButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    highlightedBorderColor: Colors.blue.shade300,
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.blue.shade900,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.logo_facebook,
                          size: 16,
                          color: Colors.blue.shade900,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hesabın yok mu?'),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Kayıt Ol',
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
    );
  }
}
