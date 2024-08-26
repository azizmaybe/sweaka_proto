import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:sweaka_supervisor_2/Screens/DashboardScreens/DashboardTabs/CommandesTab.dart';
import 'package:sweaka_supervisor_2/Screens/DashboardScreens/ProductsGraph.dart';
import 'package:sweaka_supervisor_2/Screens/DashboardScreens/ProgressChart.dart';




import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/SweakaSwitch.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  SweakaDecoration client = SweakaDecoration(hintText: "Nom client, téléphone", icon: SweakaIcons.search);
  SweakaDecoration secteurs = SweakaDecoration(hintText: "Tout les secteurs",);
  SweakaDecoration rechercher_produit = SweakaDecoration(hintText: "Tous les secteurs", icon: SweakaIcons.search);
  SweakaDecoration titre_ticket = SweakaDecoration(hintText: "Titre note");
  SweakaDecoration description_ticket = SweakaDecoration(hintText: "Ecrire ici");
    SweakaDecoration status = SweakaDecoration(hintText: "Status ticket");

  bool _isChecked = false;
  bool _switch = false;

  late TabController _tabController;

   List<String> listeproduit = ["Produit1", "Produit2", "Produit3",];
     final _userEditTextController = TextEditingController();


 @override
void initState(){
  _tabController = TabController(length: 3, vsync: this);
  super.initState();

}

@override
void dispose(){
  _tabController.dispose;
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Caféteria Gamour', style: SweakaText.Title),
                    Text('+22 XX XXX XXX', style: SweakaText.overline),
                  ],
                ),
                Spacer(),
                SweakaSwitch(
                  value: true,
                  onChanged: (value) {
                    setState(() {
                      _switch = value;
                    });
                    print('Switch value changed to: $value');
                  },
                ),
              ],
            ),
            backgroundColor: SweakaColors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(SweakaIcons.arrow_left),
              color: SweakaColors.primaryColor,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: SweakaColors.secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.fromLTRB(31, 13, 31, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SweakaIcons.shopping_bag,
                              size: 20,
                              color: SweakaColors.white,
                            ),
                            SizedBox(height: 3),
                            Text('12',
                                style: TextStyle(
                                    color: SweakaColors.white,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text('Commandes',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 10)),
                      ]),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: SweakaColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.fromLTRB(31, 13, 31, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SweakaIcons.truck,
                              size: 20,
                              color: SweakaColors.white,
                            ),
                            SizedBox(height: 5),
                            Text('125',
                                style: TextStyle(
                                    color: SweakaColors.white,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text('Livreurs',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 10)),
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: SweakaColors.secondary_text,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.fromLTRB(31, 13, 31, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SweakaIcons.map,
                              size: 20,
                              color: SweakaColors.white,
                            ),
                            SizedBox(height: 3),
                            Text('12',
                                style: TextStyle(
                                    color: SweakaColors.white,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text('Secteurs',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 10)),
                      ]),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: SweakaColors.alert,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.fromLTRB(31, 13, 31, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SweakaIcons.user,
                              size: 20,
                              color: SweakaColors.white,
                            ),
                            SizedBox(height: 5),
                            Text('125',
                                style: TextStyle(
                                    color: SweakaColors.white,
                                    fontFamily: 'Noto Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text('Clients',
                            style: TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 10)),
                      ]),
                    ),
                  ],
                ),
              ),
   
Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
    decoration: BoxDecoration(
      color: SweakaColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: SweakaColors.border_1,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x2A30491F),
          blurRadius: 12,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Graphique des commandes', style: SweakaText.title_Client),
          Text('Cette semaine • 14 - 21 Juin 2022',  style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       SizedBox(height: 10,),
       DropdownSearch<String>(
                        items: listeproduit,
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
                            decoration: rechercher_produit.textfield,
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
                                Text('Liste des produits',
                                    style: SweakaText.Title),
                                Text('Séléctionner le produit',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: secteurs.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
                      ),
                      SizedBox(height: 10,),
                     
                     

                      // Graph des commandes
                       SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ChartExample()),

                
            
      ],
    ),
  ),
),
   
Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
    decoration: BoxDecoration(
      color: SweakaColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: SweakaColors.border_1,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x2A30491F),
          blurRadius: 12,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Graphique des commandes', style: SweakaText.title_Client),
          Text('Cette semaine • 14 - 21 Juin 2022',  style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       SizedBox(height: 10,),
       DropdownSearch<String>(
                        items: listeproduit,
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
                            decoration: rechercher_produit.textfield,
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
                                Text('Liste des produits',
                                    style: SweakaText.Title),
                                Text('Séléctionner le produit',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: secteurs.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
                      ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Row(
                            
                            children: [
                            Text('13',style: TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontSize: 20, fontWeight: FontWeight.w600)),
                            Baseline(
                              baseline: 18,
                              baselineType: TextBaseline.alphabetic,
                              child: Text(' client',style: TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontSize: 10, fontWeight: FontWeight.w600))),
                          ],),
                           SizedBox(height: 10),
                          Text('Effectués \ndes commandes', style: SweakaText.Title ,textAlign: TextAlign.center,)
                        ],),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Row(
                            
                            children: [
                            Text('13',style: TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontSize: 20, fontWeight: FontWeight.w600)),
                            Baseline(
                              baseline: 18,
                              baselineType: TextBaseline.alphabetic,
                              child: Text(' client',style: TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontSize: 10, fontWeight: FontWeight.w600))),
                          ],),
                          SizedBox(height: 10),
                          Text('Effectués \ndes commandes', style: SweakaText.Title ,textAlign: TextAlign.center,)
                        ],)
                      ],), 
                      SizedBox(height: 10),
                       Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                            value: 0.8,
                            
                            backgroundColor: SweakaColors.error,
                            valueColor: AlwaysStoppedAnimation<Color>(SweakaColors.success),
                          ),
                      ),
                    ),
                    SizedBox(height: 10),
                      Column(
                        children:[
                          Row(
                          children: [
                          Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4.5, color: SweakaColors.success),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('Commandes livrées', style: SweakaText.body_medium)
                        ],),
                        SizedBox(height: 5),
                        Row(
                          children: [
                          Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4.5, color: SweakaColors.error),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('Commandes annulées', style: SweakaText.body_medium)
                        ],),
                        ]
                      ),  
      ],
    ),
  ),
),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
    decoration: BoxDecoration(
      color: SweakaColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: SweakaColors.border_1,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x2A30491F),
          blurRadius: 12,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Top livrerus', style: SweakaText.title_Client),
          Text('Cette semaine • 14 - 21 Juin 2022',  style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       SizedBox(height: 10,),
       SizedBox(
        width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
  child: ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return Column(
        children: [
        Container(
          child: Row(
            children: [
              SizedBox(height: 10),
             ProfilePicture(
                name: 'Ahmed Maldini.',
                radius: 15,
                fontsize: 10,
                random: true,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Ahmed Maldini', style: SweakaText.Title),
                Text('22 commandes', style: SweakaText.Subtitle),
              ],),
              Spacer(),
              Row(children: [
                Text('1230.4', style: TextStyle(color: SweakaColors.secondary_text, fontFamily: 'Noto Sans', fontSize: 20, fontWeight: FontWeight.w700)),
                Baseline(
                  baseline: 18,
                  baselineType: TextBaseline.alphabetic,
                  child: Text('Unit', style: TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontSize: 14, fontWeight: FontWeight.w500))),
              ],)
          ],)
        ),
        Divider(color: SweakaColors.border_1, thickness: 2,),
        SizedBox(height: 10),
      ],);
    },
  ),
),
        
      ],
    ),
  ),
),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
    decoration: BoxDecoration(
      color: SweakaColors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: SweakaColors.border_1,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x2A30491F),
          blurRadius: 12,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Top Clients', style: SweakaText.title_Client),
          Text('Cette semaine • 14 - 21 Juin 2022',  style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       SizedBox(height: 10,),
       SizedBox(
        width: double.infinity,
      height: MediaQuery.of(context).size.height*0.3,
  child: ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return Column(
        children: [
        Container(
          child: Row(
            children: [
              SizedBox(height: 10),
             ProfilePicture(
                name: 'Ahmed Maldini.',
                radius: 15,
                fontsize: 10,
                random: true,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Ahmed Maldini', style: SweakaText.Title),
                Text('22 commandes', style: SweakaText.Subtitle),
              ],),
              Spacer(),
              Row(children: [
                Text('1230.4', style: TextStyle(color: SweakaColors.secondary_text, fontFamily: 'Noto Sans', fontSize: 20, fontWeight: FontWeight.w700)),
                Baseline(
                  baseline: 18,
                  baselineType: TextBaseline.alphabetic,
                  child: Text('Unit', style: TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontSize: 14, fontWeight: FontWeight.w500))),
              ],)
          ],)
        ),
        Divider(color: SweakaColors.border_1, thickness: 2,),
        SizedBox(height: 10),
      ],);
    },
  ),
),
        
      ],
    ),
  ),
),

            ]),
          ),
        ));
  }
}
