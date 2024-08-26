import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:sweaka_supervisor_2/Screens/Seller%20List%20Screens/DashboardTabs/CommandesTab.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/DashboardTabs/CreditTab.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/ProductsGraph.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import '../../constants/SweakaSwitch.dart';
import 'ProgressChart.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key}) : super(key: key);

  @override
  State<SellerDashboard> createState() => _SellerDashboard();
}

class _SellerDashboard extends State<SellerDashboard> with SingleTickerProviderStateMixin {
  SweakaDecoration client = SweakaDecoration(hintText: "Nom client, téléphone", icon: SweakaIcons.search);
  SweakaDecoration produit = SweakaDecoration(hintText: "Nom du produit",);
  SweakaDecoration rechercher_produit = SweakaDecoration(hintText: "Nom du produit", icon: SweakaIcons.search);
  SweakaDecoration titre_ticket = SweakaDecoration(hintText: "Titre note");
  SweakaDecoration description_ticket = SweakaDecoration(hintText: "Ecrire ici");
  SweakaDecoration status = SweakaDecoration(hintText: "Status ticket");
  SweakaDecoration objectif = SweakaDecoration(hintText: "Objectif");
  SweakaDecoration debutdate = SweakaDecoration(hintText: "Date début", icon: SweakaIcons.calendar, color: SweakaColors.grey_text);
  SweakaDecoration enddate = SweakaDecoration(hintText: "Date fin", icon: SweakaIcons.calendar, color: SweakaColors.grey_text);
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
            title: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ahmed Maldini', style: SweakaText.Title),
                    Text('Performance livreur', style: SweakaText.overline),
                  ],
                ),
               
            backgroundColor: SweakaColors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(SweakaIcons.arrow_left),
              color: SweakaColors.primaryColor,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(SweakaIcons.edit, color: SweakaColors.primaryColor),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [

                Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 4, color: Colors.deepPurple),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Ahmed Maldini',
                          style: SweakaText.Title),
                      Text('+22 XX XXX XXX',
                          style: SweakaText.overline),
                    ],
                  ),
                  SizedBox(
                            height: 20,
                          ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: SweakaColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.fromLTRB(25, 13, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('PAIEMENT DES COMMANDES',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ), ),
                          Row(children: [
                            Text('12.350',style: TextStyle(
                                          color: SweakaColors.white,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                        ),),
                            Text('unit',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                        ),),
                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(SweakaIcons.carret___up, color: SweakaColors.success,),
                            Text('+ 2.5 %', style: TextStyle(
                                          color: SweakaColors.success,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),),
                            Text('Than last month',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),),
                          ],),
                          ],
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10 ),
                       height: double.infinity,
                       width: 1,
                       color: Color.fromARGB(33, 255, 255, 255),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('CRÉDITS DES COMMANDES',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ), ),
                          Row(children: [
                            Text('0.657',style: TextStyle(
                                          color: SweakaColors.white,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                        ),),
                            Text('unit',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10,
                                        ),),
                          ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(SweakaIcons.carret___up, color: SweakaColors.error,),
                            Text('+ 2.5 %', style: TextStyle(
                                          color: SweakaColors.error,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),),
                            Text('Than last month',style: TextStyle(
                                          color: SweakaColors.grey_text,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),),
                          ],),
                          ],
                        ),
                        
   
                      ]),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                    
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: ListView.builder(
                         
                        itemCount: 5,
                         scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height * 0.12,
                                  decoration: BoxDecoration(
                                    color: SweakaColors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(28, 0, 0, 0),
                                        offset: Offset(0, 8),
                                        blurRadius: 12,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        SweakaIcons.trending_up,
                                        size: 20,
                                        color: SweakaColors.secondaryColor,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                          color: SweakaColors.primaryColor,
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text('Transaction', style: SweakaText.overline),
                              ],
                            ),
                          );
                        },
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
          Text('Graphique des produits', style: SweakaText.title_Client),
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
                            padding: EdgeInsets.only(left: 15, top: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Liste des produits',
                                        style: SweakaText.Title),
                                    Text('Séléctionner le produit',
                                        style: SweakaText.overline),
                                    SizedBox(height: 10) 
                                  ],
                                ),
                                Spacer(),
                                Icon(SweakaIcons.sliders,size:25, color: SweakaColors.light_text),
                                SizedBox(width: 15,)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: produit.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
                      ),
                      SizedBox(height: 10,),
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Column(children: [
                           Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.success, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                        Text('Maximale', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Text('Prix de vente',style: TextStyle(color: SweakaColors.light_text, fontSize: 8, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))

                        ],),
                        Column(children: [
                          Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.error, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                        Text('Minimale', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                           Text('Prix de vente',style: TextStyle(color: SweakaColors.light_text, fontSize: 8, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))

                        ],),
                        Column(children: [
                          Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.state, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                        Text('Moyenne', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                           Text('Prix de vente',style: TextStyle(color: SweakaColors.light_text, fontSize: 8, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))

                        ],)
                      ],),
                      SizedBox(height: 10),

                      // Graph Produit
                       SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: GrapheProduitSeller()),

                       SizedBox(height: 5),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                          children: [
                          Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4.5, color: SweakaColors.secondaryColor),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('Produits vendus', style: SweakaText.body_medium)
                        ],),
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
                    Text('Produits livrés', style: SweakaText.body_medium)
                        ],),
                       
                       ],)
            
      ],
    ),
  ),
),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
   
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text('Paiement', style: SweakaText.title_Client),
          Text('Total payé', style: SweakaText.subtitle_Client),

          Row(
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child:RadialBarChart(),
                          ),
                          Spacer(),
                          Column(children: [
           Row(children: [
                          Text('160.43', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                         Text('Montant', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),

        ],),
                        ],
                      ),
   Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: SweakaColors.shadow_3,
                    onPrimary: SweakaColors.secondaryColor,
                    elevation: 0,
                    minimumSize: Size(0, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      
                      Text(
                        'Modifier objectif',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: SweakaColors.secondaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(SweakaIcons.edit, color: SweakaColors.secondaryColor, 
                      ),
                    ],
                  ),

                  onPressed: () {

                    showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            ),
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
            isScrollControlled:true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Modifier Objectif', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('Objectif du mois', style: SweakaText.overline),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Objectif', style: SweakaText.textfieldTitle),
                    ),
                    TextFormField(
                      decoration: objectif.textfield,
                    ),

                    
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                                child: Text('Date début', style: SweakaText.textfieldTitle),
                              ),
                              TextFormField(
                                decoration: debutdate.textfield,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                                child: Text('Date début', style: SweakaText.textfieldTitle),
                              ),
                              TextFormField(
                                decoration: enddate.textfield,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    ElevatedButton(
                onPressed: () {
                // TODO: Add button functionality here
                },
                style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: SweakaColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                'Valider',
                style: SweakaText.button,
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                // code to execute when the text is clicked
                },
                child: Center(
                child: Text(
                  "Annuler",
                  style: SweakaText.menu,
                ),
                ),
              ),
                  ],
                ),
              );
            },
          );
                  }
                   
                ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Column(children: [
           Row(children: [
                          Text('230.04', style: TextStyle(color: SweakaColors.success, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                         Text('Montant', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),

        ],),
        Column(
          children: [
          Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                        Text('Argent', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
        ],),
        Column(
          children: [
          Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                        Text('Remise', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
        ],),
        

      ],),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Icon(SweakaIcons.alert_circle, size: 20, color: SweakaColors.light_text,),
        SizedBox(width: 10),
        Text('La valeur amount est afficher lorsque le livreur a un paiement\n à valider. Cliquer sur le box afin de le confirmer.',
        style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans') , softWrap: true,
        maxLines: 2,)
      ],)                  
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Row(
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Ticket livreur', style: SweakaText.title_Client),
          Text('12 tickets',  style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       SizedBox(
    height: 200,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 10, bottom: 14),
        child: Container(
          width: MediaQuery.of(context).size.width*0.65,
          decoration: BoxDecoration(
            color: SweakaColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: SweakaColors.border_1,
              width: 1,
            ),
           
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
                  child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Mission title', style: SweakaText.title_Client),
                Text('22 juin, 2022',  style: SweakaText.subtitle_Client),
              ],),
             
                 ),
             Divider(thickness: 1,
             indent: 20,
             endIndent: 20,
             color: SweakaColors.border_1,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: 
                   Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.',
                   style: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Noto Sans',
    color: SweakaColors.secondary_text),  softWrap: true,),
             ),     
            ],
          ),
        ),
      );
    }
    ),
  ),
     Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: SweakaColors.shadow_3,
                    onPrimary: SweakaColors.secondaryColor,
                    elevation: 0,
                    minimumSize: Size(0, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ajouter note',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: SweakaColors.secondaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(SweakaIcons.plus, color: SweakaColors.secondaryColor),
                    ],
                  ),

                  onPressed: () {

                    showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            ),
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
            isScrollControlled:true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Nouvelle note', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('Ajouter note au livreur', style: SweakaText.overline),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Titre', style: SweakaText.textfieldTitle),
                    ),
                    TextFormField(
                      decoration: titre_ticket.textfield,
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                      child: Text('Note', style: SweakaText.textfieldTitle),
                    ),
                    TextFormField(
                      decoration: description_ticket.textfield,
                       keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 5,
                    ),
                    SizedBox(height: 16,),
                    ElevatedButton(
                onPressed: () {
                // TODO: Add button functionality here
                },
                style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: SweakaColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                'Ajouter',
                style: SweakaText.button,
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                // code to execute when the text is clicked
                },
                child: Center(
                child: Text(
                  "Annuler",
                  style: SweakaText.menu,
                ),
                ),
              ),
                  ],
                ),
              );
            },
          );
                  }
                   
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
