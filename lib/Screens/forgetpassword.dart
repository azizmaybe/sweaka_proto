import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/Styles/bigbutton.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import '../constants/sweakaColors.dart';
import '../constants/sweakaText.dart';



class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);
  @override

  _ForgetpasswordState createState() => _ForgetpasswordState();
  }

  
  
class _ForgetpasswordState extends State<Forgetpassword> {
   String _errorMessage = '';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: SweakaColors.primaryColor,
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 69,
          ),
          Container(
            child: Center(
              child: Container(
                child: Image.asset('assets/Images/forgot_pwd_illustration.png'),
              ),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mot de passe?',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    // height: 23,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: SweakaColors.primary_text),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'oubliée?',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    // height: 23,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: SweakaColors.primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Veuillez entrez votre adresse e-mail associée avec votre',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: SweakaText.body_small
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'compte afin de réinitianilser votre mot de passe.',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: SweakaText.body_small
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 40,
            width: 320,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: SweakaColors.primary_background,
                prefixIcon: Icon(
                  SweakaIcons.at_sign,
                  color: SweakaColors.secondary_text,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: SweakaColors.grey_scale_4,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: SweakaColors.primaryColor,),
                ),
                hintText: 'Adresse mail',
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: SweakaColors.grey_scale_4),
              ),
            ),
          ),
          SizedBox(
            height: 73,
          ),
          ElevatedButton(
            style: buttonPrimary,
            onPressed: () {
            },
            child: Text('Envoyer'),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(_errorMessage, style: TextStyle(color: SweakaColors.error),),
            ),
        ]),
      ),
    );
  }
  void validateEmail(String val) {
    if(val.isEmpty){
  setState(() {
    _errorMessage = "L'e-mail ne peut pas être vide";
  });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Aucun compte existe avec cet adresse mail";
      });
    }else{
      setState(() {
        _errorMessage = "";
      });
    }
  }
  

}
