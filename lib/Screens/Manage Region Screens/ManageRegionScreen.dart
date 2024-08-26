import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/constants/SweakaSwitch.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

import 'RegionDetailsScreen.dart';

class ManageRegionScreen extends StatefulWidget {
  const ManageRegionScreen({Key? key}) : super(key: key);

  @override
  State<ManageRegionScreen> createState() => _ManageRegionScreen();
}

class _ManageRegionScreen extends State<ManageRegionScreen> with SingleTickerProviderStateMixin {

SweakaDecoration client = SweakaDecoration(hintText: "Nom du secteur", icon: SweakaIcons.search);
SweakaDecoration sector = SweakaDecoration(hintText: "Nom du secteur",);


bool _trusted = false;


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     appBar: AppBar(
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
    actions: <Widget>[
      IconButton(
        icon: const Icon(SweakaIcons.settings),
        onPressed: () {},
        color: SweakaColors.grey_text,
      ),
      IconButton(
        icon: const Icon(SweakaIcons.notification_bell),
        onPressed: () {},
        color: SweakaColors.grey_text,
      ),
    ],
    backgroundColor: SweakaColors.white,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(SweakaIcons.menu),
      color: SweakaColors.grey_text,
    ),
    bottom:  PreferredSize(preferredSize: Size.fromHeight(55.0),
    child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Column(
                   children: [
                     TextFormField(
                     decoration: client.textfield,
                      ),
                      SizedBox(height: 8,),
                      RichText(text: TextSpan(children: [
                        WidgetSpan(
                          child: Row(children: [
                            Text('22 ', style: TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontWeight: FontWeight.w600, fontSize: 10)),
                            Baseline(
                              baseline: 10,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text('Villes', style:TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontWeight: FontWeight.w400, fontSize: 8)))
                          ],)
                        )
                      ]))
                   ],
                 ),),),
  ),

      body: Column(
            children: [
              
                 SizedBox(height: 12), 
                Expanded(
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap:() {
                             Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegionDetailsScreen()),
      );
                            },
                            child: Container(
                                  margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                          
                                        children: [
                            
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Secteur Sud",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: SweakaColors.success,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Active",
                                style: TextStyle(
                                  color: SweakaColors.success,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CRÈE LE",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8),
                              ),
                              Text(
                                "27 mai 2022, 10h:30 min",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8),
                              ),
                            ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        
                                          const Spacer(),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Row(
                          
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(SweakaIcons.users,size: 16,color: SweakaColors.secondaryColor),
                                  SizedBox(width: 3),
                                  Baseline(
                                    baseline: 14,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "12",
                                      style:TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontWeight: FontWeight.w400, fontSize: 8),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 14,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "clients",
                                      style:TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontWeight: FontWeight.w400, fontSize: 8),
                                    ),
                                  ),
                                ],
                              ),
                                     SizedBox(width: 10),          
                               Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  
                                  Icon(SweakaIcons.map,size: 16,color: SweakaColors.secondaryColor),
                                  SizedBox(width: 3),
                                  Baseline(
                                    baseline: 14,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "6",
                                      style:TextStyle(color: SweakaColors.primaryColor, fontFamily: 'Noto Sans', fontWeight: FontWeight.w400, fontSize: 8),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 14,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "villes",
                                      style:TextStyle(color: SweakaColors.light_text, fontFamily: 'Noto Sans', fontWeight: FontWeight.w400, fontSize: 8),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          );
                        }),
                ),
            ],
          ),
      
  /// Add Region 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(
            backgroundColor: SweakaColors.secondaryColor,
            elevation: 8.0,
            highlightElevation: 12.0,
            child: Icon(SweakaIcons.plus),
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
                    Text('Ajouter secteur', style: SweakaText.Title),
                    Text('Nouveau secteur', style: SweakaText.Subtitle),
                    SizedBox(height: 20,),
                    Row(
                        children: [                                    
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
                              decoration: sector.textfield
                  ),
                           ),
                            ],
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
                backgroundColor: SweakaColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: Size(double.infinity, 46),
                ),
                child: Text(
                'Ajouter Secteur',
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
          ),

    );



    
  }
}
