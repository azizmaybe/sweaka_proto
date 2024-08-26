import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/Tabs/HistoriqueTab.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/Tabs/ShiftTab.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';

class SellerDetails extends StatefulWidget {
  const SellerDetails({Key? key}) : super(key: key);

  @override
  State<SellerDetails> createState() => _SellerDetails();
}

class _SellerDetails extends State<SellerDetails> with SingleTickerProviderStateMixin {

  

  bool _switchValue = false;
  List<bool> isSelected = [
    false,
    false,
    false,
  ];
  
  late TabController _tabController;
  var currentIndex =0;

  

  @override
void initState(){
  _tabController = TabController(length: 2, vsync: this);
  super.initState();
}

@override
void dispose(){
  _tabController.dispose;
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 40, left: 18, right: 18,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(SweakaIcons.arrow_left),
                  Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 4, color: Colors.deepPurple),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Ahmed Maldini',
                          style: SweakaText.Title),
                      Text('+22 XX XXX XXX',
                          style: SweakaText.overline),
                    ],
                  ),
                  
                  // Switch
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _switchValue = !_switchValue;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            width: 44,
                            height: 24,
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(2),
                            curve: Curves.ease,
                            alignment: _switchValue
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                color: _switchValue
                                    ? Color.fromARGB(255, 248, 136, 89)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

           Padding(padding: EdgeInsets.only(left:16 , right: 16, bottom: 10),
           child: Container(
              height: MediaQuery.of(context).size.height,
               child: Column(
                children: [
                  Container(height: 36),
                Container(
                  color: SweakaColors.border_1,
                child: TabBar(
                  controller: _tabController,
                  unselectedLabelColor: SweakaColors.light_text,
                    labelStyle: TextStyle(fontWeight: FontWeight.w600),
                    indicator: BoxDecoration(
                      color: SweakaColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    tabs: [
                Tab(text: 'Shifts'),
                Tab(text: 'Historique'),]
            ),
            ),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: [
            Shift(),
            HistoriqueShifts(),
          ]),)
           ],
           ),
             ),
          
           ),
            ],
        ),
      ),
     
     /// Floating Buttons
      extendBody: true,
      bottomNavigationBar:  FloatingNavbar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFBAC3D5),
        itemBorderRadius: 28,
        width: MediaQuery.of(context).size.width*0.4,
            onTap: (int val) {
              setState(() {
      currentIndex = val; // update currentIndex
    });
            },
            currentIndex: currentIndex,
            items: [
              FloatingNavbarItem(icon: SweakaIcons.bar_chart_2,),
              FloatingNavbarItem(icon: SweakaIcons.truck,),
              FloatingNavbarItem(icon: SweakaIcons.file,),
            ],
          ),
    );



    
  }
}
