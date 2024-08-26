import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformation();
}

class _PersonalInformation extends State<PersonalInformation> {


  List<String> listegenre = ["Unkown", "Femme", "Homme"];
  List<String> listeville = ["Ville1", "Ville2", "Ville3",];
  final _userEditTextController = TextEditingController();

  SweakaDecoration nom = SweakaDecoration(hintText: "Nom",icon : SweakaIcons.user, color: SweakaColors.grey_text);
  SweakaDecoration prenom = SweakaDecoration(hintText: "Prénom",icon : SweakaIcons.user,color: SweakaColors.grey_text);
  SweakaDecoration phone = SweakaDecoration(hintText: "Téléphone", icon: SweakaIcons.lock,color: SweakaColors.grey_text);
  SweakaDecoration genre = SweakaDecoration(hintText: "Séléctionner genre",);




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
                'Informations personnelles',
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
                children: [
                      ///Field Nom Livreur 
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nom',
                              style: SweakaText.textfieldTitle
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: TextFormField(
                                  style: SweakaText.textfield_text,
                                  decoration: nom.textfield,
                                ),
                              ),
                            ),
                          ],
                        ),
                     
                    SizedBox(height: 15),

                      /// Field Prénom Livreur 
                   
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prénom',
                              style: SweakaText.textfieldTitle,
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TextFormField(
                                  style: SweakaText.textfield_text,
                                  decoration: prenom.textfield,

                                ),
                              ),
                            ),
                          ],
                        ),
                     
                  
                  SizedBox(height: 15),

                  ///Field Numéro Téléphone
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Numéro Téléphone',
                        style: SweakaText.textfieldTitle
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                          style: SweakaText.textfield_text,
                          decoration: phone.textfield,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  /// Field Genre 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Genre',
                        style: SweakaText.textfieldTitle
                      ),
                          SizedBox(height: 5),
                      DropdownSearch<String>(
                        items: listegenre,
                        popupProps: PopupProps.modalBottomSheet(
                          fit: FlexFit.loose,

                          itemBuilder: (context, item, isSelected) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected ? SweakaColors.secondaryColor : SweakaColors.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (isSelected)
                                    Icon(
                                      Icons.check_circle,
                                      color: SweakaColors.secondaryColor,
                                    ),
                                ],
                              ),
                            );
                          },
                          modalBottomSheetProps: ModalBottomSheetProps(
                            useSafeArea: true,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                          ),
                          showSelectedItems: true,
                          
                          title: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sexe',
                                    style: SweakaText.Title),
                                Text('Séléctionner le sexe du livreur',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: genre.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
                      ),
                        ],
                  ),
             
                ],
              ),
            ),
          ),

          /// Boutton Enregistrer
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
        'Enregistrer',
        style: SweakaText.button,
      ),
    ),
  ),

        ],
      ),
    );
  }
}
