import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';

import '../../constants/SweakaSwitch.dart';
import 'Change Code PIN.dart';


class AboutSweaka extends StatefulWidget {
  const AboutSweaka({Key? key}) : super(key: key);

  @override
  State<AboutSweaka> createState() => _AboutSweaka();
}

class _AboutSweaka extends State<AboutSweaka> {


  List<String> listegenre = ["Unkown", "Femme", "Homme"];
  final _userEditTextController = TextEditingController();

  SweakaDecoration pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user, color: SweakaColors.grey_text);
  SweakaDecoration new_pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user,color: SweakaColors.grey_text);
  SweakaDecoration confirm_pw = SweakaDecoration(hintText: "Entrer mot de passe", icon: SweakaIcons.lock,color: SweakaColors.grey_text);

bool _showAboutSweaka = true;
bool _activatedPIN= false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'À propos',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Sweaka et l’application',
                style: SweakaText.Subtitle,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,

        /// Back Button 
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(SweakaIcons.arrow_left),
              color: SweakaColors.primaryColor,
            iconSize: 30.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
        Padding(
                      padding: EdgeInsets.only(right:10),
                      child: CircleAvatar(
                        child: Image(image: AssetImage('assets/Images/app.png')),
                      ),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Sweaka', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 24, fontFamily: 'Noto Sans',fontWeight: FontWeight.w900)),
                      Text('Solutions', style: TextStyle(color: SweakaColors.secondary_text, fontSize: 12, fontFamily: 'Noto Sans',fontWeight: FontWeight.w400)),
                    ],)
      ],),
    ),

     Text('À propos',style: SweakaText.Title),
     Text('Information générales', style: SweakaText.Subtitle),
     SizedBox(height: 10),
     Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.',
     style: SweakaText.overline),
     SizedBox(height: 10),
     Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.',
     style: SweakaText.overline),
     SizedBox(height: 10),
     Text('Contactez nous',style: SweakaText.Title),
     Text('Voici nos coordonnées', style: SweakaText.Subtitle),
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
              Container(
                  child: Row(
                    children: [
                       Icon(SweakaIcons.facebook, color: Color(0xFF3B5998), ),
                       SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text('Facebook', style: SweakaText.Title),
                          Text('Sweaka.inc', style: SweakaText.Subtitle),
                        ],
                      ),
                      Spacer(),
                      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor),
                    ],
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  Container(
                  child: Row(
                    children: [
                      Icon(SweakaIcons.linkedin, color: Color(0xFF0072B1), ),
                       SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Linkedin', style: SweakaText.Title),
                          Text('Sweaka', style: SweakaText.Subtitle),
                        ],
                      ),
                      Spacer(),
                      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor),
                    ],
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  Container(
                  child: Row(
                    children: [
                      Icon(SweakaIcons.mail, color: SweakaColors.primaryColor, ),
                       SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Adresse mail', style: SweakaText.Title),
                          Text('Envoyez nous un mail', style: SweakaText.Subtitle),
                        ],
                      ),
                      Spacer(),
                      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor),
                    ],
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8.0),
                   child: Divider(thickness: 1, color: SweakaColors.light_text),
                 ),
                  Container(
                  child: Row(
                    children: [
                      Icon(SweakaIcons.globe, color: SweakaColors.primaryColor, ),
                       SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Site web', style: SweakaText.Title),
                          Text('Découvrez note site web', style: SweakaText.Subtitle),
                        ],
                      ),
                      Spacer(),
                      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor),
                    ],
                  ),
                ),
            ],
          ),
            
          
        ),
      ),
   
  ],
),
      ),
    );
  }
}
