import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';


class HistoriqueClient extends StatefulWidget {
  const HistoriqueClient({Key? key}) : super(key: key);

  @override
  State<HistoriqueClient> createState() => _HistoriqueClient();
}

class _HistoriqueClient extends State<HistoriqueClient> {

  SweakaDecoration client = SweakaDecoration(hintText: "Nom Client", icon: SweakaIcons.search);
 
 bool _isChecked = false;

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
                'Boukadir',
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
      ),
      body:
       Column(
            children: [
              ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                    child: Icon(SweakaIcons.users, color: SweakaColors.primaryColor, size: 20),
                  ),
                  title: Text('Liste des Clients', style: SweakaText.Title),
                  subtitle: Text('6 Clients', style: SweakaText.overline),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('4',  style: SweakaText.Title),
                    Text('villes',  style: SweakaText.overline),
                  ],),
                ),       
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
                                  title: Text('Caféteria Gamour', style: SweakaText.title_Client),
                                  subtitle: Text('Nom de la ville', style: SweakaText.subtitle_Client),
   
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
  }
}
