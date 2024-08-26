import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/constants/SweakaSwitch.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

import 'Tabs/CityTab.dart';
import 'Tabs/ClientsTab.dart';

class RegionDetailsScreen extends StatefulWidget {
  const RegionDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RegionDetailsScreen> createState() => _RegionDetailsScreen();
}

class _RegionDetailsScreen extends State<RegionDetailsScreen> with SingleTickerProviderStateMixin {

SweakaDecoration client = SweakaDecoration(hintText: "Nom du secteur", icon: SweakaIcons.search);
SweakaDecoration sector = SweakaDecoration(hintText: "Nom du secteur",);
SweakaDecoration modifier_sector = SweakaDecoration(hintText: "Nom du secteur",);


late TabController _tabController;

 @override
void initState(){
  _tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: SweakaColors.white,
       appBar: AppBar(
        elevation: 0,
        title: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Secteur Sud',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Vendredi • 22 Juin, 2022',
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
         actions: [
    Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Column(
                        children: [
                    Text('Modifier secteur', style: SweakaText.Title),
                    Text('Vendredi • 22 Juin, 2022', style: SweakaText.Subtitle),
                    ],
                    ),
                    Spacer(),

                                    Column(
                                      children: [
                                        Text('6',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Color(0xFF2A3049))),
                                        Text('Ville',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8,
                                                color: Color(0xFFBAC3D5))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 24, // height of the line
                                      width: 1, // thickness of the line
                                      color: Color(
                                          0xFFECEFF4), // color of the line
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      children: [
                                        Text('4',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Color(0xFF2A3049))),
                                        Text('Clients',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8,
                                                color: Color(0xFFBAC3D5))),
                                      ],
                                    ),

                    ],
                    ),
                    SizedBox(height: 20,),                                  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nom du secteur',
                                style: SweakaText.Title,
                              ),
                              SizedBox(height: 8),
                              Container(
                            width: MediaQuery.of(context).size.width*0.9,
                             child: TextFormField(
                              decoration: modifier_sector.textfield
                  ),
                           ),
                            ],
                          ),

                    SizedBox(height: 20,),
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
                'Sauvegarder',
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
              ),
            );
            }
          );
        },
      );
        },
        icon: Icon(SweakaIcons.edit, color: SweakaColors.secondaryColor, size: 25,),
      ),
    ),
  ],
      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 18.0),
       child: Container(
                height: MediaQuery.of(context).size.height,
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
                  Tab(text: 'Villes'),
                  Tab(text: 'Clients'),]
              ),
              ),
            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
              CityTab(),
              ClientsTab(),
            ]),)
             ],
             ),
               ),
     ),
    );



    
  }
}
