import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/services/APIs/api.dart' as http;


class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  State<ClientList> createState() => _ClientList();
}

class _ClientList extends State<ClientList> {

  SweakaDecoration client = SweakaDecoration(hintText: "Nom Client", icon: SweakaIcons.search);
 
 bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Boukadir',
                style: SweakaText.Title,
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              child: Text(
                'Vendredi',
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
            children: [
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: TextFormField(
                 decoration: client.textfield,
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10 ),
                    child: Row(
                      children: [
                        Text('22', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: SweakaColors.primary_text, fontFamily: 'Noto Sans')),
                        Text('clients', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: SweakaColors.light_text, fontFamily: 'Noto Sans')),
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
                                height: 70 ,
                                child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage('assets/Images/app.png'),
                                      radius: 17,
                                    ),
                                    title: Text('Caféteria Gamour', style: SweakaText.title_Client),
                                    subtitle: Text('Nom de la ville', style: SweakaText.subtitle_Client),
                                    trailing: Icon(SweakaIcons.minus_circle, color: SweakaColors.error,),                                  
                                  ),
                              ), 
                                Divider(color: SweakaColors.grey_scale_2,)
                            ],
                          );
                        }),
                ),
      
      
            ],
          ),
      


      /// Add Client 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: SweakaColors.secondaryColor,
        elevation: 8.0,
        highlightElevation: 12.0,
        child: Icon(SweakaIcons.user_plus),
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
                      decoration: client.textfield),
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
                                      title: Text('Caféteria Gamour', style: SweakaText.title_Client),
                                      subtitle: Text('Nom de la ville', style: SweakaText.subtitle_Client),
                                        trailing: Checkbox(
                                          checkColor: Colors.white, 
                                          activeColor: SweakaColors.secondaryColor, 
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: SweakaColors.border_1), 
                                            borderRadius: BorderRadius.circular(4.0), 
                                          ),
                                        value: _isChecked,
                                        onChanged: (_isChecked) => setState(() => this._isChecked = _isChecked!),
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
    );
  }
}
