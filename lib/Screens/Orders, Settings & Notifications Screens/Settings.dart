import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/Screens/Orders,%20Settings%20&%20Notifications%20Screens/AboutSweaka.dart';
import 'package:sweaka_supervisor_2/Screens/Orders,%20Settings%20&%20Notifications%20Screens/CodePIN.dart';
import 'package:sweaka_supervisor_2/Screens/Orders,%20Settings%20&%20Notifications%20Screens/Password.dart';
import 'package:sweaka_supervisor_2/constants/SweakaSwitch.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

import 'PersonalInformation.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String? _nom_client,
      _phone,
      _email,
      _num_registre,
      _num_fiscal,
      _nni,
      _credit_limit;

  SweakaDecoration nom_client = SweakaDecoration(
    hintText: "Nom Client",
  );
  SweakaDecoration phone = SweakaDecoration(
      hintText: "Téléphone",
      icon: SweakaIcons.phone,
      color: SweakaColors.grey_scale_4);
  SweakaDecoration email = SweakaDecoration(
      hintText: "Adresse mail",
      icon: SweakaIcons.mail,
      color: SweakaColors.grey_scale_4);
  SweakaDecoration registre = SweakaDecoration(hintText: "Registre");
  SweakaDecoration fiscal = SweakaDecoration(hintText: "Numéro fiscal");
  SweakaDecoration nni = SweakaDecoration(hintText: "Numéro NNI");
  SweakaDecoration credit_limit = SweakaDecoration(hintText: "0");

  bool _trusted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SweakaColors.primaryColor,
        backgroundColor: SweakaColors.white,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 20,
          child: Text(
            'Paramètres',
            style: TextStyle(
                color: SweakaColors.primary_text,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontFamily: 'Noto Sans'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.deepPurple),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Changer photo',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Noto Sans',
                          color: SweakaColors.secondaryColor),
                    ),
                    SizedBox(height: 10),
                    Text('Ahmed Maldini', style: SweakaText.Title),
                     
                    Text('ahmed.maldini@sweaka.com',
                        style: SweakaText.overline),
                  ],
                ),
              ),
              SizedBox(height: 20,),
             Text('Paramètres compte',style: SweakaText.Title),
             Text('Modifier les information du compte', style: SweakaText.Subtitle),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0),
               child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 238, 240, 245),
                 borderRadius: BorderRadius.circular(12),
               ),
               child: Column(
                 children: [
                 GestureDetector(
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PersonalInformation()));
  },
  child: Container(
    child: Row(
      children: [
        Icon(SweakaIcons.user, color: SweakaColors.primaryColor),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Informations personnelles', style: SweakaText.Title),
            Text('Modifier les informations du compte', style: SweakaText.Subtitle),
          ],
        ),
        Spacer(),
        Icon(SweakaIcons.chevron_right),
      ],
    ),
  ),
),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  GestureDetector(
                    onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Password()));
  },
                    child: Container(
                     child: Row(
                       children: [
                     Icon(SweakaIcons.lock, color: SweakaColors.primaryColor),
                     SizedBox(width: 10),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text('Mot de passe', style: SweakaText.Title),
                       Text('Modifier votre mot de passe', style: SweakaText.Subtitle),
                     ],),
                     Spacer(),
                     Icon(SweakaIcons.chevron_right),
                                   ]),),
                  ),
               ],
             )),
            ),

             Text('Paramètres compte',style: SweakaText.Title),
             Text('Modifier les information du compte', style: SweakaText.Subtitle),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0),
               child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 238, 240, 245),
                 borderRadius: BorderRadius.circular(12),
               ),
               child:
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodePIN()));
                    },
                    child: Container(
                     child: Row(
                       children: [
                     Icon(SweakaIcons.shield, color: SweakaColors.primaryColor),
                     SizedBox(width: 10),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text('PIN code', style: SweakaText.Title),
                       Text('Modifier ou ajouter PIN code', style: SweakaText.Subtitle),
                     ],),
                     Spacer(),
                     Icon(SweakaIcons.chevron_right),
                                   ]),),
                  ),
               ),
            ),
             Text('Vous pouvez activer ou bien désactiver le PIN code depuis cette section. En cas de perte du code PIN, vous devez déconnecter puis reconnecter afin d’entrer un nouveau code PIN.',
             style: SweakaText.overline),
             SizedBox(height: 10),
             Text('À propos',style: SweakaText.Title),
             Text('Information générales', style: SweakaText.Subtitle),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0),
               child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 238, 240, 245),
                 borderRadius: BorderRadius.circular(12),
               ),
               child: Column(
                 children: [
                 GestureDetector(
                   onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutSweaka()));
  },
                   child: Container(
                     child: Row(
                       children: [
                     Icon(SweakaIcons.alert_circle, color: SweakaColors.primaryColor),
                     SizedBox(width: 10),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text('À propos', style: SweakaText.Title),
                       Text('À propos Sweaka et l’application', style: SweakaText.Subtitle),
                     ],),
                     Spacer(),
                     Icon(SweakaIcons.chevron_right)
                   ]),),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  Container(
                   child: Row(
                     children: [
                   Icon(SweakaIcons.book_open, color: SweakaColors.primaryColor),
                   SizedBox(width: 10),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text('Condition générales', style: SweakaText.Title),
                     Text('Dernière mise à jour le 14 juillet, 2022', style: SweakaText.Subtitle),
                   ],),
                   Spacer(),
                   Icon(SweakaIcons.chevron_right),
                 ]),),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  Container(
                   child: Row(
                     children: [
                   Icon(SweakaIcons.file_text, color: SweakaColors.primaryColor),
                   SizedBox(width: 10),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text('Politique de confidentialité', style: SweakaText.Title),
                     Text('Dernière mise à jour le 23 juin, 2022', style: SweakaText.Subtitle),
                   ],),
                   Spacer(),
                   Icon(SweakaIcons.chevron_right),
                 ]),),
                 
               ],
             )),
            ),
            ]
          ),
        ),
      ),
    );
  }
}
