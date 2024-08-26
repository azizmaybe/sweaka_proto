import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';

import '../../constants/SweakaDecoration.dart';
import 'OrderDetailsScreen.dart';



class ClientOrdersScreen extends StatefulWidget {

  const ClientOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ClientOrdersScreen> createState() => _ClientOrdersScreen();
}

class _ClientOrdersScreen extends State<ClientOrdersScreen> {

SweakaDecoration transactions = SweakaDecoration(hintText: "Ref transaction", icon: SweakaIcons.search);
  
  @override
  Widget build(BuildContext context) {
 
 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
    title: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 18,
          child: Text(
            'Commandes client ',
            style: SweakaText.Title
          ),
        ),
        Container(
          width: double.infinity,
          height: 18,
          child: Text(
            'Caféterria Ahmed',
            style: SweakaText.Subtitle
          ),
        ), 
      ],
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(SweakaIcons.sliders),
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
                 child: TextFormField(
                 decoration: transactions.textfield,
                  ),),),
  ),

      body:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Text("Aujourd'huit", style: SweakaText.Title),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text("2 transactions", style: SweakaText.overline),
          ),
          Expanded(
                  child: ListView.builder(
          itemCount: 17,
          itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderDetailsScreen()),
      );
      },
            child: Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(167, 231, 236, 243),
                  ),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfilePicture(
                name: 'Hubert Blaine Wolfeschlegelsteinhausenbergerdorff Sr.',
                radius: 15,
                fontsize: 10,
                random: true,
              ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                                  Text(
                                    "Caféteria Gamour",
                                    style: SweakaText.Title,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                
                              Text(
                                "23 articles commandés",
                                style: TextStyle(
                                  color: SweakaColors.state,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  fontFamily: 'Noto Sans'
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('#01313025', style: SweakaText.body_medium),
                      Text('En cours', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, fontFamily: 'Noto Sans', color: SweakaColors.alert)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
                                "DERNIER",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8),
                              ),
                              Text(
                                "4 Avril 2023, 00h:00 min",
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
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "TOTAL COMMANDE",
                                style: TextStyle(
                                    color: SweakaColors.light_text,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 6),
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(SweakaIcons.cash, color: SweakaColors.success, size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                    "200.0",
                                    style: TextStyle(
                                        color: SweakaColors.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Baseline(
                                    baseline: 14,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      "unit",
                                      style: TextStyle(
                                          color: SweakaColors.light_text,
                                    fontWeight: FontWeight.w500,
                                          fontSize: 8),
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

      ],)
    );
  }
}
