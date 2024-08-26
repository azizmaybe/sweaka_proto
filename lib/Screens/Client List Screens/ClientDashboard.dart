import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/DashboardTabs/CommandesTab.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/DashboardTabs/CreditTab.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/ProductsGraph.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/SweakaSwitch.dart';
import 'ProgressChart.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  State<ClientDashboard> createState() => _ClientDashboard();
}

class _ClientDashboard extends State<ClientDashboard> with SingleTickerProviderStateMixin {
  SweakaDecoration client = SweakaDecoration(hintText: "Nom client, téléphone", icon: SweakaIcons.search);
  SweakaDecoration produit = SweakaDecoration(hintText: "Nom du produit",);
  SweakaDecoration rechercher_produit = SweakaDecoration(hintText: "Nom du produit", icon: SweakaIcons.search);
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
                              SweakaIcons.trending_up,
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
                        Text('Transactions',
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
                              SweakaIcons.shopping_bag,
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
                        Text('Commandes',
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
          Text('Graphique des clients', style: SweakaText.title_Client),
          Text('Cette semaine • 14 - 21 Juin 2022', style: SweakaText.subtitle_Client),
        ],),
        Spacer(),
        Icon(SweakaIcons.more_horizontal)
       ],),
       Container(
                height: MediaQuery.of(context).size.height*0.4,
                 child: Column(
                  children: [
                   SizedBox(height: 8,),
                  Container(
                    color: SweakaColors.border_1,
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: SweakaColors.light_text,
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                      labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      
                      indicator: BoxDecoration(
                        color: SweakaColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      

                      tabs: [
                  Tab(text: 'Commandes'),
                  Tab(text: 'Ventes'),
                   Tab(text: 'Crédits'),]
              ),
              ),
            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
              MyChart(),
              Text('haha'),
              Text('haaaha'),
            ]),)
             ],
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
                        height: 300,
                        width: double.infinity,
                        child: ChartExample()),

                       SizedBox(height: 5),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Text('Commandes', style: SweakaText.body_medium)
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
                    Text('Ventes', style: SweakaText.body_medium)
                        ],),
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
                    Text('Endomagés', style: SweakaText.body_medium)
                        ],),
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

                  onPressed: () {}
                   
                ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Column(children: [
           Row(children: [
                          Text('23.04', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
                          Baseline(
                            baseline: 15,
                            baselineType: TextBaseline.alphabetic,
                            child: Text('unit',style: TextStyle(color: SweakaColors.light_text, fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans'))),
                        ],),
                         Text('Taux payé', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),

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
                        Text('Crédits', style: TextStyle(color: SweakaColors.primaryColor, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Noto Sans')),
        ],),
        

      ],),

      
   
                     
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
          Text('Ticket client', style: SweakaText.title_Client),
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
                   child: Row(
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('T-2020', style: SweakaText.title_Client),
                Text('22 juin, 2022 - 12:30 min',  style: SweakaText.subtitle_Client),
              ],),
              Spacer(),
              Text('En attente', style: TextStyle(color: SweakaColors.alert, fontWeight: FontWeight.w700, fontSize: 10, fontFamily: 'Noto Sans'))
             ],),
                 ),
             Divider(thickness: 1,
             indent: 20,
             endIndent: 20,
             color: SweakaColors.border_1,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Titre de ticket'),
                   Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Li Europan lingues es membres del sam familie. Lor separat existentie es un myth.',
                   style: SweakaText.overline,  softWrap: true,),
                 ],
               ),
             ),
             SizedBox(height: 10),
             Container(
              decoration: BoxDecoration(
          color: SweakaColors.border_1,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  children: [
                     ProfilePicture(
                      name: 'Hubert Blaine Wolfeschlegelsteinhausenbergerdorff Sr.',
                      radius: 15,
                      fontsize: 10,
                      random: true,
                    ),
                    SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ahmed Maldini', style: TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontSize: 12, fontWeight: FontWeight.w600)),
                    SizedBox(height: 2,),
                    Text('Superviseur', style: TextStyle(color: SweakaColors.secondary_text, fontFamily: 'Noto Sans', fontSize: 10, fontWeight: FontWeight.w500)),
                  ],
                ),
                Spacer(),

                /// Modifier Ticket
                GestureDetector(
                  onTap: (){
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
                    Row(
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Modifier ticket', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('Gérer ticket client', style: SweakaText.overline),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('T-2020', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('22 juin, 2022 - 12:30 min', style: SweakaText.overline),
                          ],
                        ),
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Titre', style: SweakaText.textfieldTitle),
                    ),
                    TextFormField(
                      decoration: titre_ticket.textfield,
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Titre', style: SweakaText.textfieldTitle),
                    ),
                    DropdownSearch<String>(
                        items: ['En Attente' , 'Traité', 'Problème'],
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
                                Text('Status Ticket',
                                    style: SweakaText.Title),
                                Text('Changer le status du ticket',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: status.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
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
                    Row(
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Done', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('Écrire la solution proposée', style: SweakaText.overline),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('T-2020', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('22 juin, 2022 - 12:30 min', style: SweakaText.overline),
                          ],
                        ),
                      ],
                    ),
                     
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                      child: Text('Solution', style: SweakaText.textfieldTitle),
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
                backgroundColor: SweakaColors.success,
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
                },
                style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: SweakaColors.success,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                'Continuer',
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

                  },
                  child: Icon(SweakaIcons.edit, color: SweakaColors.primaryColor, size : 20)),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap:() {
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
                    Row(
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Modifier ticket', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('Gérer ticket client', style: SweakaText.overline),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('T-2020', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('22 juin, 2022 - 12:30 min', style: SweakaText.overline),
                          ],
                        ),
                      ],
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Titre', style: SweakaText.textfieldTitle),
                    ),
                    TextFormField(
                      decoration: titre_ticket.textfield,
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text('Titre', style: SweakaText.textfieldTitle),
                    ),
                    DropdownSearch<String>(
                        items: ['En Attente' , 'Traité', 'Problème'],
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
                                Text('Status Ticket',
                                    style: SweakaText.Title),
                                Text('Changer le status du ticket',
                                    style: SweakaText.overline),
                                SizedBox(height: 10)
                              ],
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: status.textfield,
                          baseStyle: SweakaText.textfield_text
                        ),
                        onChanged: print,
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
                    Row(
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Problème', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('Écrire la raison du problème', style: SweakaText.overline),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('T-2020', style: SweakaText.Title),
                            SizedBox(height: 3,),
                            Text('22 juin, 2022 - 12:30 min', style: SweakaText.overline),
                          ],
                        ),
                      ],
                    ),
                     
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                      child: Text('Solution', style: SweakaText.textfieldTitle),
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
                backgroundColor: SweakaColors.error,
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
                },
                style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: SweakaColors.error,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                'Continuer',
                style: SweakaText.button,
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                
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

                  },
                  child: Icon(SweakaIcons.trash, color: SweakaColors.error, size : 20)),
             ]),
              ),)       
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
                        'Ajouter ticket',
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
                    Text('Listes des clients', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('22 Clients', style: SweakaText.overline),
                    
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
