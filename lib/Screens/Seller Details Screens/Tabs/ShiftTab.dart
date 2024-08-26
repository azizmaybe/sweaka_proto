import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/ClientList.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/services/shifts/shifts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/models/shifts.dart';

import '../../../models/sectors.dart';
class Shift extends StatefulWidget {
  const Shift({super.key});

  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {

  List<bool> isSelected = [
    false,
    false,
    false,
  ];
  SweakaDecoration secteur = SweakaDecoration(hintText: "Chercher secteur", icon: SweakaIcons.search);
  List<String> Days = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
  List<bool> SelectedDay = List.filled(7, false);
  late TabController _tabController;
  

  int _selectedDay = 0;
  List<Shifts> shifts=[];
 
      
       @override
  void initState() {
    super.initState();
    _loadShifts();
  }

  Future<void> _loadShifts() async {
    List<Shifts> loadedShifts = await ShiftsRepository.loadShiftsOnline();
    setState(() {
      shifts = loadedShifts;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Liste des shifts',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2A3049))),
                        Text('12 shifts',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5A6385))),
                      ],
                    ),
                    
                    /// Add Shifts Button
                    IconButton(
                      icon: Icon(Icons.add_circle_outline_outlined,
                          color: Color(0xFFF88859), size: 30),
                      onPressed: () {
                        
                    /// Add Shift Modal
                      showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nouvelle Shift', style: SweakaText.Title),
                SizedBox(height: 20,),
                /// Nouveau Secteur 
                GestureDetector
                ( 
                  onTap: () {
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
                    Text('Listes des secteurs', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('22 secteurs', style: SweakaText.overline),
                    SizedBox(height: 16,),

                    TextFormField(
                      decoration: secteur.textfield),
                    SizedBox(height: 5),

                  Expanded(                   
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage('assets/Images/app.png'),
                                    
                                    radius: 17,
                                  ),
                                  title: Text('Boukadir', style: SweakaText.title_Client),
                                  subtitle: Text('12 villes', style: SweakaText.subtitle_Client),
                                    
                                ),
                                Divider(
                                  color: SweakaColors.border_1,
                                  height: 1,
                                  thickness: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                            ],
                          );
                        }),
                ),

                  ],
                ),
              );
            },
          );
                  },
                  child: Row(
                    children: [                                    
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Secteur',
                            style: SweakaText.Title,
                          ),
                          Text(
                              'Séléctionnez secteur',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: SweakaColors.light_text)),
                        ],
                      ),
                      Spacer(),
                      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                /// Modifier Journée 
                GestureDetector(
  onTap: () {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
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
              SizedBox(height: 16,),
              Expanded(
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return ListView.builder(
                      itemCount: Days.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(Days[i], style: SweakaText.title_Client),
                          selected: SelectedDay[i],
                          onTap: () {
                            setState(() {
                              // Reset all values to false except the selected item
                              for (int j = 0; j < SelectedDay.length; j++) {
                                SelectedDay[j] = (j == i);
                              }
                            });
                          },
                          trailing: SelectedDay[i] ? Icon(SweakaIcons.check_circle, color: SweakaColors.secondaryColor) : null,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  },
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Journée',
            style: SweakaText.Title,
          ),
          Text(
            'Séléctionnez journée',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: SweakaColors.light_text,
            ),
          ),
        ],
      ),
      Spacer(),
      Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
    ],
  ),
),

                SizedBox(height: 20,),
                ElevatedButton(
  onPressed: () {
    // TODO: Add button functionality here
  },
  style: ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: SweakaColors.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    minimumSize: Size(double.infinity, 46),
  ),
  child: Text(
    'Ajouter Shift',
    style: SweakaText.button,
  ),
),
SizedBox(height: 10,),
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
      },
    );
                      },
                    ),
                  ],
                )),
             SizedBox(
              height:MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: shifts.length,
                itemBuilder: (BuildContext context, i) {                  
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    child:  Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SECTEUR',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 8,
                                        color: Color(0xFFBAC3D5))),
                                Text('${shifts[i].name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xFF2A3049))),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {showModalBottomSheet(
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
            children: [
              /// Boutton Liste Client
              GestureDetector(
                onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientList()),
      );
      },
                child: Row(
                  children: [
                    Icon(
                      SweakaIcons.users,
                      color: SweakaColors.primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Liste Client',
                          style: SweakaText.Title,
                        ),
                        Text(
                            'Gérer la liste des clients',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: SweakaColors.light_text)),
                      ],
                    ),
                    Spacer(),
                    Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Modifier shifts //
              GestureDetector(
                onTap: () {
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
                    Text('Modifier shift', style: SweakaText.Title),
                    SizedBox(height: 20,),
                    /// Modifier Secteur 
                    GestureDetector
                    ( 
                      onTap: () {
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
                        Text('Listes des secteurs', style: SweakaText.Title),
                        SizedBox(height: 3,),
                        Text('22 secteurs', style: SweakaText.overline),
                        SizedBox(height: 16,),
              
                        TextFormField(
                          decoration: secteur.textfield),
                        SizedBox(height: 5),
              
                      Expanded(                   
                      child: ListView.builder(
                        itemCount: 17,
                        itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage('assets/Images/app.png'),
                                        
                                        radius: 17,
                                      ),
                                      title: Text('Boukadir', style: SweakaText.title_Client),
                                      subtitle: Text('12 villes', style: SweakaText.subtitle_Client),
                                        
                                    ),
                                    Divider(
                                      color: SweakaColors.border_1,
                                      height: 1,
                                      thickness: 1,
                                      indent: 16,
                                      endIndent: 16,
                                    ),
                                ],
                              );
                            }),
                    ),
              
                      ],
                    ),
                  );
                },
              );
                      },
                      child: Row(
                        children: [                                    
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boukadir',
                                style: SweakaText.Title,
                              ),
                              Text(
                                  'Secteur séléctionné',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: SweakaColors.light_text)),
                            ],
                          ),
                          Spacer(),
                          Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    /// Modifier Journée 
                    GestureDetector(
                onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Listes des clients', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('22 Clients', style: SweakaText.overline),
                    SizedBox(height: 16,),
                    Expanded(
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return ListView.builder(
                            itemCount: Days.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(Days[i], style: SweakaText.title_Client),
                                selected: SelectedDay[i],
                                onTap: () {
                                  setState(() {
                                    _selectedDay = i;
                                    // Reset all values to false except the selected item
                                    for (int j = 0; j < SelectedDay.length; j++) {
                                      SelectedDay[j] = (j == i);
                                    }
                                  });
                                },
                                trailing: SelectedDay[i] ? Icon(SweakaIcons.check_circle, color: SweakaColors.secondaryColor) : null,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
              }
            );
                  },
                );
                },
                child: Row(
                children: [
                  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${Days[_selectedDay]}',
                style: SweakaText.Title,
              ),
              Text(
                'Journée séléctionné',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: SweakaColors.light_text,
                ),
              ),
            ],
                  ),
                  Spacer(),
                  Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
                ],
                ),
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
                'Confirmer Modification',
                style: SweakaText.button,
                ),
              ),
              SizedBox(height: 10,),
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
                child: Row(
                  children: [
                    Icon(
                      SweakaIcons.edit,
                      color: SweakaColors.primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modifier shift',
                          style: SweakaText.Title,
                        ),
                        Text(
                            'Gérer la shift sélectionnée',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: SweakaColors.light_text)),
                      ],
                    ),
                    Spacer(),
                    Icon(SweakaIcons.chevron_right, color: SweakaColors.primaryColor,),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Retirer Shift //
              Row(
                children: [
                  Icon(
                    SweakaIcons.minus_circle,
                    color: SweakaColors.error,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Retirer shift',
                        style: SweakaText.Title,
                      ),
                      Text(
                          'Retirer cette shift de ce livreur',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: SweakaColors.light_text)),
                    ],
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      );
       },
    );
  },
);},
                                  icon: Icon(Icons.more_horiz_rounded),
                                  color: Color(0xFF2A3049),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Vendredi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Color(0xFF2A3049))),
                                        Text('Journée',
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
                                        Text('${shifts[i].cities_count}',
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
                                        Text('${shifts[i].clients_count}',
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
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1, // height of the line
                          width: double.infinity, // thickness of the line
                          color: Color(0xFFECEFF4), // color of the line
                        ),
                      ],
                    ),     
                  );
                }),),],),
    );
  }
}