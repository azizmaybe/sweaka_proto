import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/HistoriqueClient.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
class CityTab extends StatefulWidget {
  const CityTab({super.key});

  @override
  State<CityTab> createState() => _CityTabState();
}

class _CityTabState extends State<CityTab> {
bool isChecked =false;
SweakaDecoration ville = SweakaDecoration(hintText: "Nom Ville", icon: SweakaIcons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8.0, bottom: 10 ),
          child: Row(
            children: [
              Icon(SweakaIcons.map,
              color: SweakaColors.primaryColor,
              size: 24),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Liste de Ville', style: SweakaText.Title),
                Text('6 villes', style: SweakaText.Subtitle)
              ],),
            ],
          ),
        ),
       Expanded(
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Container(
                                height: 50 ,
                                child: ListTile(
                                    title: Text('Boukadir', style: SweakaText.title_Client),
                                    trailing: Icon(SweakaIcons.minus_circle, color: SweakaColors.error,),                                  
                                  ),
                              ), 
                                Divider(
                                  thickness:1,
                                  color: SweakaColors.border_1,)
                            ],
                          );
                        }),
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
                      Icon(SweakaIcons.plus, color: SweakaColors.secondaryColor),
                      SizedBox(width: 8),
                      Text(
                        'Ajouter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: SweakaColors.secondaryColor,
                        ),
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
                    Text('Listes des villes', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('22 Villes', style: SweakaText.overline),
                    SizedBox(height: 16,),

                    TextFormField(
                      decoration: ville.textfield),
                    SizedBox(height: 16,),
                    Text('3 villes séléctionnés', style: TextStyle(fontFamily: 'Noto Sans', fontSize: 9, fontWeight: FontWeight.w400, color: SweakaColors.secondaryColor)),
                    SizedBox(height: 5,),

                  Expanded(                   
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return ListView.builder(
                        itemCount: 17,
                        itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ListTile(
                                      title: Text('Boukadir', style: SweakaText.title_Client),
                                        trailing: Checkbox(
                                          checkColor: Colors.white, 
                                          activeColor: SweakaColors.secondaryColor, 
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: SweakaColors.border_1), 
                                            borderRadius: BorderRadius.circular(4.0), 
                                          ),
                                        value: isChecked,
                                        onChanged: (_isChecked) => setState(() => this.isChecked = _isChecked!),
                                      ),
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
                            });
                    }
                  ),
                ),

                  ],
                ),
              );
            },
          );
                  },
                ),
      ),
      ],)
    );
  }
}