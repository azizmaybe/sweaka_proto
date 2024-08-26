import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/AddClient.dart';

import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/services/APIs/api.dart' as http;

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({Key? key}) : super(key: key);

  @override
  State<ClientListScreen> createState() => _ClientListScreen();
}

class _ClientListScreen extends State<ClientListScreen> {
  SweakaDecoration client = SweakaDecoration(
      hintText: "Nom client, téléphone", icon: SweakaIcons.search);

  bool _isChecked = false;

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
                    fontFamily: 'Noto Sans'),
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
                    fontFamily: 'Noto Sans'),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: client.textfield,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
                itemCount: 17,
                itemBuilder: (context, i) {
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(167, 231, 236, 243),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(""),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Name Name",
                                              style: SweakaText.Title,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
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
                                        Text(
                                          "+22 12 345 678",
                                          style: SweakaText.overline,
                                        ),
                                        Text("En attente",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Noto Sans',
                                              color: SweakaColors.state,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(SweakaIcons.check_circle, size: 18, color: SweakaColors.alert)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "DERNIER ACHAT",
                                          style: TextStyle(
                                            color: SweakaColors.light_text,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 6,
                                            fontFamily: 'Noto Sans'),
                                        ),
                                        Text(
                                          "4 Avril 2023, 00h:00min",
                                          style: TextStyle(
                                            color: SweakaColors.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            fontFamily: 'Noto Sans'),
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
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "DERNIERE COMMANDE",
                                          style: TextStyle(
                                            color: SweakaColors.light_text,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 6,
                                            fontFamily: 'Noto Sans'),
                                        ),
                                        Text(
                                          "4 Avril 2023, 00h:00min",
                                          style: TextStyle(
                                            color: SweakaColors.primaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9,
                                            fontFamily: 'Noto Sans'),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Crédit",
                                          style: TextStyle(
                                              color: SweakaColors.light_text,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        ),
                                        Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text(
                                              "200.0",
                                              style: TextStyle(
                                                  color: SweakaColors.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Baseline(
                                              baseline: 14,
                                              baselineType:
                                                  TextBaseline.alphabetic,
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
                  );
                }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          heroTag: 1,
          backgroundColor: SweakaColors.secondaryColor,
          elevation: 8.0,
          highlightElevation: 12.0,
          child: Icon(SweakaIcons.user_plus),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddClient()),
            );
          },
        ),
        SizedBox(width: 20),

        /// Map Button
        FloatingActionButton(
          heroTag: 2,
          backgroundColor: SweakaColors.secondaryColor,
          elevation: 8.0,
          highlightElevation: 12.0,
          child: Icon(SweakaIcons.map),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddClient()),
            );
          },
        ),
      ]),
    );
  }
}
