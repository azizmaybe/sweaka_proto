import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/sweakaText.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({ Key? key }) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: SweakaColors.primaryColor
          ),
          leading: 
           IconButton(
            onPressed: (){}, 
              icon: Icon(SweakaIcons.menu)),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bonjour',
                style: SweakaText.body_medium,
              ),
              Text(
                'Mahdi Chtioui',
                style: SweakaText.overline,
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){}, 
              icon: Icon(SweakaIcons.settings, color: SweakaColors.secondary_text,)),
            IconButton(
              onPressed: (){}, 
              icon: Icon(SweakaIcons.notification_bell, color: SweakaColors.secondary_text,)),
          ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
             // width: 328,
             // height: 56,
              //padding: EdgeInsets.fromLTRB(0, 10, 0, 12),
            child: Row(
             children: [
              Expanded(child: 
              ListTile(
               leading: Container(
                height: 40,
                width: 40,
                child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                
                color: SweakaColors.success,
                child: Icon(SweakaIcons.check_circle, color: SweakaColors.grey_scale_0,size: 14.67,),
               ),
               ),
               title: Text('23450', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
               )),
               subtitle: Text('Livrée', style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: SweakaColors.light_text,
               ),),
              ),
              ),
              
              Expanded(child: ListTile(
                leading: Container(
                height: 40,
                width: 40,
                child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                
                color: SweakaColors.alert,
                child: Icon(SweakaIcons.clock, color: SweakaColors.grey_scale_0,size: 14.67,),
               ),
               ),
               
               title: Text('450', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
               )),
               subtitle: Text('En cours', style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: SweakaColors.light_text,
               ),),
              )),
             Expanded(child:  ListTile(
                leading: Container(
                height: 40,
                width: 40,
                child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                
                color: SweakaColors.error,
                child: Icon(SweakaIcons.x_circle, color: SweakaColors.grey_scale_0,size: 14.67,),
               ),
               ),
               
               title: Text('1302', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
               )),
               subtitle: Text('Annulées', style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: SweakaColors.light_text,
               ),),
              ),)
            ],
            ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                    child: TextFormField(
                      controller: _controller,
                      cursorColor: SweakaColors.grey_scale_2,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: SweakaColors.grey_scale_4,
                        prefixIcon: Icon(
                          SweakaIcons.search,
                          color: SweakaColors.secondaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: SweakaColors.grey_scale_3,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: SweakaColors.grey_scale_4,
                          ),
                        ),
                        hintText: 'Ref. commande, Nom livreur',
                        hintStyle: TextStyle(
                          color: SweakaColors.grey_scale_4,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          onPressed: _controller.clear,
                          icon: Icon(SweakaIcons.x_circle),
                          color: SweakaColors.light_text,
                        ),
                      ),
                    ),
                  ),
                
                  IconButton(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    iconSize: 24,
                    onPressed: () {},
                    icon: const Icon(SweakaIcons.sliders),
                    color: SweakaColors.light_text,
                    splashRadius: 1,
                  ),
          ],
        ),
      ),
    );
  }
}