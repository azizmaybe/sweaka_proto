import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';


class AddSeller extends StatefulWidget {
  const AddSeller({Key? key}) : super(key: key);

  @override
  State<AddSeller> createState() => _AddSeller();
}

class _AddSeller extends State<AddSeller> {


  List<String> listegenre = ["Unkown", "Femme", "Homme"];
  List<String> listeville = ["Ville1", "Ville2", "Ville3",];
  final _userEditTextController = TextEditingController();

  SweakaDecoration nom = SweakaDecoration(hintText: "Nom");
  SweakaDecoration prenom = SweakaDecoration(hintText: "Prénom");
  SweakaDecoration utilisateur = SweakaDecoration(hintText: "Nom Utilisateur");
  SweakaDecoration phone = SweakaDecoration(hintText: "Téléphone");
  SweakaDecoration genre = SweakaDecoration(hintText: "Séléctionner genre");
  SweakaDecoration recherche_ville = SweakaDecoration(hintText: "Chercher ville", icon: SweakaIcons.search);
  SweakaDecoration ville = SweakaDecoration(hintText: "Séléctionner ville");


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
                'Nouveau livreur',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Remplir les données du livreur',
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
          SizedBox(height: 20),
          /// Seller's Picture
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 120),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                padding: EdgeInsets.all(5),
                strokeWidth: 2,
                dashPattern: [5, 5],
                color: SweakaColors.grey_scale_0,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        SweakaIcons.camera,
                        size: 24,
                        color: SweakaColors.secondaryColor,
                      ),
                      SizedBox(height: 17),
                      Text(
                        "Télécharger votre photo.",
                        style: TextStyle(
                          color: SweakaColors.light_text,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Noto Sans",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 50),

              // Couleur Livreur
              Container(
                width: 84,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: SweakaColors.border_1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: SweakaColors.border_1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Couleur \ndu livreur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: SweakaColors.primary_text)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          /// Add Seller Form
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      ///Field Nom Livreur 
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nom Livreur',
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
                      ),
                      SizedBox(width: 10),

                      /// Field Prénom Livreur 
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prénom Livreur',
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
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  /// Field Nom Utilisateur
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Utilisateur',
                        style: SweakaText.textfieldTitle
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                          style: SweakaText.textfield_text,
                          decoration: utilisateur.textfield,
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
                  SizedBox(height: 15),

                  /// DropDownButton Ville 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ville',
                        style: SweakaText.textfieldTitle
                      ),
                      SizedBox(height: 5),
                      DropdownSearch<String>(
                        items: listeville,
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
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            controller: _userEditTextController,
                            decoration: recherche_ville.textfield,
                          ),
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
                                Text('Liste des villes',
                                    style: SweakaText.Title),
                                Text('Séléctionner la ville du livreur',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: ville.textfield,
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

          /// Boutton Nouveau Livreur

          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
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
    );
  }
}
