import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/HistoriqueClient.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
class ClientsTab extends StatefulWidget {
  const ClientsTab({super.key});

  @override
  State<ClientsTab> createState() => _ClientsTabState();
}

class _ClientsTabState extends State<ClientsTab> {
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
              Icon(SweakaIcons.users,
              color: SweakaColors.primaryColor,
              size: 24),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Liste des clients', style: SweakaText.Title),
                Text('6 clients', style: SweakaText.Subtitle)
              ],),
            ],
          ),
        ),
       Expanded(
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, i) {
                          return Container(
                            height: 70,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                CircleAvatar(
                                          backgroundImage: AssetImage('assets/Images/app.png'),
                                          radius: 17,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                        Row(
                                          children: [
                                            Text('Caféteria Gamour', style: SweakaText.title_Client),
                                            SizedBox(width: 8,),
                                            Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                )
                                          ],
                                        ),
                                        Text('+22 XX XXX XXX', style: SweakaText.subtitle_Client),
                                        Text('Non visité', style: SweakaText.overline),
                                        ],
                                        ),
                                        
                                        Spacer(),
                                        Icon(SweakaIcons.minus_circle, color: SweakaColors.error,),    
                          ]
                          ),
                          Divider(thickness: 1,color: SweakaColors.border_1,),
                              ],
                            ),
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
                    Text('Listes des clients', style: SweakaText.Title),
                    SizedBox(height: 3,),
                    Text('22 Clients', style: SweakaText.overline),
                    SizedBox(height: 16,),

                    TextFormField(
                      decoration: ville.textfield),
                    SizedBox(height: 16,),
                    Text('3 clients séléctionnés', style: TextStyle(fontFamily: 'Noto Sans', fontSize: 9, fontWeight: FontWeight.w400, color: SweakaColors.secondaryColor)),
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
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage('assets/Images/app.png'),
                                      radius: 17,
                                    ),
                                      title: Text('Boukadir', style: SweakaText.title_Client),
                                      subtitle: Text('+22 XX XXX XXX', style: SweakaText.subtitle_Client),
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