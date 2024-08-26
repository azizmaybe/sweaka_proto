import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';

import '../../constants/SweakaDecoration.dart';


class SellerDetailScreenAdvanced extends StatefulWidget {
  const SellerDetailScreenAdvanced({ Key? key }) : super(key: key);

  @override
  _SellerDetailScreenAdvancedState createState() => _SellerDetailScreenAdvancedState();
}

 SweakaDecoration transactions =
      SweakaDecoration(hintText: "Ref transaction", icon: SweakaIcons.search);

class _SellerDetailScreenAdvancedState extends State<SellerDetailScreenAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            SweakaIcons.arrow_left, color: SweakaColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: RichText(
          text: const TextSpan(
              text: "Order ",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: '#0123456\n',
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: '4/25/2023,10h:00min',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 10),
                )
              ]),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'En Cours',
                style: TextStyle(
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
       
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.18,
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
                                        "+22 XX XXX XXX",
                                        style: TextStyle(
                                            color: SweakaColors.grey_text,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9,
                                            fontFamily: 'Noto Sans'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
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
                                  child: Row(
                                    children: [
                                      Icon(SweakaIcons.map,
                                          color: SweakaColors.primaryColor, size: 20),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ADRESSE",
                                            style: TextStyle(
                                                color: SweakaColors.light_text,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 8),
                                          ),
                                          Text(
                                            "22 Rue de marseille - Bloc2, Chlef",
                                            style: TextStyle(
                                                color: SweakaColors.secondary_text,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9),
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
                      SizedBox(
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
                                        "ASSIGNÉ AU LIVREUR LE",
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
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.18,
                  padding: const EdgeInsets.only(top: 16,bottom: 16, left: 20, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(167, 231, 236, 243),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                              Icon(SweakaIcons.cash,
                                  size: 15, color: SweakaColors.success),
                           
                          Column(
                             
                            children: [
                              Text('TOTAL COMMANDE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 6,
                                      fontFamily: 'Noto Sans',
                                      color: SweakaColors.light_text)),
                              Row(
                                children: [
                                  Text('200.4',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          color: SweakaColors.primaryColor)),
                                  Baseline(
                                      baseline: 10,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text('unit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 6,
                                              fontFamily: 'Noto Sans',
                                              color: SweakaColors.light_text))),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                          Column(
               
                                children: [
  
                                  Text('CRÉDIT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 6,
                                          fontFamily: 'Noto Sans',
                                          color: SweakaColors.light_text)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      
                                      Text('0.0',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: 'Noto Sans',
                                              color: SweakaColors.primaryColor)),
                                      Baseline(
                                          baseline: 10,
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(' unit',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 6,
                                                  fontFamily: 'Noto Sans',
                                                  color: SweakaColors.light_text))),
                                    ],
                                  ),
                                ],
                              ),
                          SizedBox(height: 10,),
                          Column(
                            
                            children: [
                              Text('DISCOUNT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 6,
                                      fontFamily: 'Noto Sans',
                                      color: SweakaColors.light_text)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [  
                                  Text('0.0',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          color: SweakaColors.primaryColor)),
                                  Baseline(
                                      baseline: 10,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(' unit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 6,
                                              fontFamily: 'Noto Sans',
                                              color: SweakaColors.light_text))),
                                ],
                              ),
                            ],
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: [
              Icon(SweakaIcons.package, color: SweakaColors.secondaryColor),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Produits commandés', style: SweakaText.Title),
                Text('12 articles', style: SweakaText.Subtitle),
              ],),
            ],),
          ),
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => 
               Column(
                  children: [
                    Stack(
      children: [
        ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.asset('assets/Images/juice.png', fit: BoxFit.cover),
          ),
          title: Row(
            children: [
              Text('Rita - Orange Juice', style: SweakaText.title_Client),
              Text(' x1', style: TextStyle(fontWeight: FontWeight.w700,
    fontSize: 16,
    color: SweakaColors.secondaryColor,
    fontFamily: 'Noto Sans',)),
            ],
          ),
          subtitle: Text('Boisson • Bouteille', style: SweakaText.subtitle_Client),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,     
                            children: [
                              Text('PRIX',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 6,
                                      fontFamily: 'Noto Sans',
                                      color: SweakaColors.light_text)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [  
                                  Text('200.4',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Noto Sans',
                                          color: SweakaColors.primaryColor)),
                                  Baseline(
                                      baseline: 10,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(' unit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 6,
                                              fontFamily: 'Noto Sans',
                                              color: SweakaColors.light_text))),
                                ],
                              ),
                            ],
                          ),
        ),
      ],
    ),
                                    Divider(
                                      color: SweakaColors.border_1,
                                      height: 1,
                                      thickness: 1,
                                      indent: 16,
                                      endIndent: 16,
                                    ),
                                ],
                              ),
              ),
            ),
        ],
      ),
    );
  }
}