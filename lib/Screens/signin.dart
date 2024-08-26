import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/forgetpassword.dart';
import 'package:sweaka_supervisor_2/Services/Authentification/login.dart';
import 'package:sweaka_supervisor_2/Styles/bigbutton.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import '../constants/sweakaColors.dart';
import '../constants/sweakaText.dart';



class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isObscure = true;
  String _errorMessage = '';
  final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    void _handleLogin() async {
  String username = _usernameController.text;
  String password = _passwordController.text;

  List loginResult = await Authentication.Login(
    username: username,
    password: password,
  );

  if (loginResult.isNotEmpty) {
    // login successful, navigate to the next page
  } else {
    // login failed, show error message
  }
}
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(131, 154, 132, 130),
              child: Center(
                child: Image.asset(
                  'assets/Images/logo.png',
                ),
              ),
            ),
            Text(
              'Content de te revoir',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: SweakaText.heading_5,
              
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Entrez votre identifiants pour accéder à votre compte.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: SweakaText.body_medium,
              
              
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Votre nom utilisateur',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: SweakaText.body_small
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 320,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: SweakaColors.primary_background,
                  prefixIcon: Icon(
                    SweakaIcons.user,
                    color: SweakaColors.primaryColor
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: SweakaColors.grey_scale_4,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: SweakaColors.primary_text,
                    ),
                  ),
                  hintText: 'Nom utilisateur',
                  hintStyle: TextStyle(
                      fontSize: 14, color: SweakaColors.grey_scale_4),
                ),
                 onChanged: (val){
                _validateEmail(val);
              },
              ),
            ),
            Text(
              _emailError,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
                )
              ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Votre mot de passe',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: SweakaColors.primary_text),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: 320,
              child: TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: SweakaColors.primary_background,
                    prefixIcon: Icon(
                      SweakaIcons.lock,
                      color: SweakaColors.primary_text,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: SweakaColors.grey_scale_4,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: SweakaColors.primaryColor,
                      ),
                    ),
                    hintText: 'Mot de passe',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: SweakaColors.grey_scale_4),
                    suffixIcon: IconButton(
                        color: SweakaColors.primary_text,
                        icon: Icon(_isObscure
                            ? SweakaIcons.eye
                            : SweakaIcons.eye_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Forgetpassword()));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'Mot de passe oubliée?',
                  style: const TextStyle(
                    color: SweakaColors.secondary_text,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
            style: buttonPrimary,
            onPressed: () {
         
            },
            child: Text('Se connecter'),
          ),
          ],
        ),
      ),
    );
  }
  String _emailError = '';

void _validateEmail(String val) {
  if (val.isEmpty) {
    setState(() {
      _emailError = 'Email can not be empty';
    });
  } else if (!EmailValidator.validate(val, true)) {
    setState(() {
      _emailError = 'Please enter a valid email address';
    });
  } else {
    setState(() {
      _emailError = '';
    });
  }
}
}

