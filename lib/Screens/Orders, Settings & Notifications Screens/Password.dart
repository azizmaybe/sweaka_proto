import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';


class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _Password();
}

class _Password extends State<Password> {


  List<String> listegenre = ["Unkown", "Femme", "Homme"];
  List<String> listeville = ["Ville1", "Ville2", "Ville3",];
  final _userEditTextController = TextEditingController();

  SweakaDecoration pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user, color: SweakaColors.grey_text);
  SweakaDecoration new_pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user,color: SweakaColors.grey_text);
  SweakaDecoration confirm_pw = SweakaDecoration(hintText: "Entrer mot de passe", icon: SweakaIcons.lock,color: SweakaColors.grey_text);





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
                'Paramètres',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'PIN code',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Add Seller Form
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      /// Mot de passe actuel field 
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mot de passe actuel',
                              style: SweakaText.textfieldTitle
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: TextFormField(
                                  style: SweakaText.textfield_text,
                                  decoration: pw.textfield,
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 5),
                     Text('Vous devez entrer vote mot de passe actuel afin de le changer.', style: SweakaText.overline),
                     
                    SizedBox(height: 15),

                      /// Nouveau mot de passe field 
                   
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nouveau mot de passe',
                              style: SweakaText.textfieldTitle,
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TextFormField(
                                  style: SweakaText.textfield_text,
                                  decoration: new_pw.textfield,

                                ),
                              ),
                            ),
                          ],
                        ),

                 
                  SizedBox(height: 15),

                  /// Confirmer Mot de passe field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirmer mot de passe',
                        style: SweakaText.textfieldTitle
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                          style: SweakaText.textfield_text,
                          decoration: confirm_pw.textfield,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  
                ],
              ),
            ),
          ),

          /// Boutton Appliquer
Spacer(),
        Padding(
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: ElevatedButton(
      onPressed: () {
        // TODO: Add onPressed functionality
      },
      style: ElevatedButton.styleFrom(
        primary: SweakaColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 46),
      ),
      child: Text(
        'Appliquer',
        style: SweakaText.button,
      ),
    ),
  ),

        ],
      ),
    );
  }
}
