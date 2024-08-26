import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/constants/SweakaSwitch.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClient();
}

class _AddClient extends State<AddClient> with SingleTickerProviderStateMixin {

  
final _formKey = GlobalKey<FormState>();
String? _nom_client, _phone, _email, _num_registre, _num_fiscal, _nni, _credit_limit;

SweakaDecoration nom_client = SweakaDecoration(hintText: "Nom Client",);
SweakaDecoration phone = SweakaDecoration(hintText: "Téléphone", icon: SweakaIcons.phone, color: SweakaColors.grey_scale_4);
SweakaDecoration email = SweakaDecoration(hintText: "Adresse mail", icon: SweakaIcons.mail, color: SweakaColors.grey_scale_4);
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
    title: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 15,
          child: Text(
            'Bonjour ',
            style: TextStyle(
              color: SweakaColors.primary_text,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              fontFamily: 'Noto Sans'
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Text(
            'Mahdi Chtioui',
            style: TextStyle(
              color: SweakaColors.primary_text,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Noto Sans'
            ),
          ),
        ),
        
      ],
    ),
  ),
   body:  
     SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Form(
                key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                       Text(
                        'Nom Client',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: nom_client.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre nom';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _nom_client = value;
                        },
                      ),
     
     
                      const SizedBox(height: 16),
                      Text(
                        'Numéro de téléphone',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: phone.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre numéro de téléphone';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _phone = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Adresse mail du client',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: email.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Num. registre',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: registre.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre numéro de registre';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _num_registre = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Num. fiscal',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: fiscal.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre numéro fiscal';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _num_fiscal = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'N.N.I. (National Number Identifier)',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: nni.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre NNI';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _nni = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Limite de crédit',
                         style: SweakaText.textfieldTitle
                       ),
                       SizedBox(height: 5),
                      TextFormField(
                        decoration: credit_limit.textfield,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre limite de crédit';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _credit_limit = value;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],),
                ),
                
                Divider(thickness: 2,),
                SizedBox(height: 10,),
                Text('Est digne de confiance?', style: SweakaText.textfieldTitle),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.',
                     softWrap: true, style: SweakaText.hintText1,),
                  ),
                  SweakaSwitch(
                                        value: true,
                                        onChanged: (value) {
                                          setState(() {
                                            _trusted = value;
                                          });
                                        print('Switch value changed to: $value');
                                      },
                                    ),
                ],),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: SweakaColors.primaryColor,
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('Nouveau Livreur',
                      style: SweakaText.button),
              ),
            ),
                ),
           ],
         ),
       ),
     ),
      
    );



    
  }
}
