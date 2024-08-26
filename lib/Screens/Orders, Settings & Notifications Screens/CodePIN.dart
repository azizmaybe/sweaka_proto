import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';

import '../../constants/SweakaSwitch.dart';
import 'Change Code PIN.dart';


class CodePIN extends StatefulWidget {
  const CodePIN({Key? key}) : super(key: key);

  @override
  State<CodePIN> createState() => _CodePIN();
}

class _CodePIN extends State<CodePIN> {


  List<String> listegenre = ["Unkown", "Femme", "Homme"];
  final _userEditTextController = TextEditingController();

  SweakaDecoration pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user, color: SweakaColors.grey_text);
  SweakaDecoration new_pw = SweakaDecoration(hintText: "Entrer mot de passe",icon : SweakaIcons.user,color: SweakaColors.grey_text);
  SweakaDecoration confirm_pw = SweakaDecoration(hintText: "Entrer mot de passe", icon: SweakaIcons.lock,color: SweakaColors.grey_text);

bool _showCodePIN = true;
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
                'Paramètres',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Changer mot de passe',
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
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 240, 245),
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Container(
            child: Row(
              children: [
                Text(_showCodePIN ? 'Désactiver PIN Code' : 'Activer PIN Code', style: SweakaText.Title),
                Spacer(),
                SweakaSwitch(
                  value: _showCodePIN,
                  onChanged: (value) {
                    setState(() {

                      _showCodePIN = value;
                    });
                    print('Switch value changed to: $value');
                  },
                ),
              ],
            ),
          ),
        
      ),
    ),
    Text('Vous devez entrer vote mot de passe actuel afin de le changer.', style: SweakaText.overline),
    Visibility(
      visible: _showCodePIN,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 240, 245),
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeCodePIN()));
            },
            child: Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Changer PIN code', style: SweakaText.Title),
                      Text('Code de 4 chiffres', style: SweakaText.Subtitle),
                    ],
                  ),
                  Spacer(),
                  Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ],
),
      ),
    );
  }
}
