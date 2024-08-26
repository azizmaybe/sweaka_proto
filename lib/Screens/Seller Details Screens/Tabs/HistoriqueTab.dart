import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/HistoriqueClient.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
class HistoriqueShifts extends StatefulWidget {
  const HistoriqueShifts({super.key});

  @override
  State<HistoriqueShifts> createState() => _HistoriqueShiftsState();
}

class _HistoriqueShiftsState extends State<HistoriqueShifts> {

  List<bool> isSelected = [
    false,
    false,
    false,
  ];
  SweakaDecoration secteur = SweakaDecoration(hintText: "Chercher secteur", icon: SweakaIcons.search);
  List<String> Days = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
  List<bool> SelectedDay = List.filled(7, false);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              children: [              
             SizedBox(
              height:MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, i) {
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
                                Text('BOUKADIR',
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
                                  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoriqueClient()),
    );},
                                  icon: Icon(SweakaIcons.users),
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
                                        Text('4',
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
                                        Text('6',
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