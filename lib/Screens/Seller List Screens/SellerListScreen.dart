import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/SweakaSwitch.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/services/seller/seller.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';

import 'package:sweaka_supervisor_2/models/seller.dart';


class SLS extends StatefulWidget {

  const SLS({Key? key}) : super(key: key);

  @override
  State<SLS> createState() => _SLS();
}

class _SLS extends State<SLS> {
  final ScrollController _scrollController = ScrollController();
  Color _backgroundColor = Colors.white.withOpacity(0.0);

    List<Seller> sellers = [];
    Seller seller = Seller();
    
    bool _showActiveOnly = false;
    

  @override
  void initState() {
    super.initState();
    _loadSellers();
  }

  Future<void> _loadSellers() async {
    List<Seller> loadedSellers = await SellerRepository.loadSellersOnline();
    setState(() {
      sellers = loadedSellers;
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    ///  Scroll Listener
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 0) {
          _backgroundColor = SweakaColors.white.withOpacity(0.5);
        } else {
          _backgroundColor = SweakaColors.white.withOpacity(0.0);
        }
      });
    });
 
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0,
            expandedHeight: 118.0,
            flexibleSpace: AppBar(
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
                        fontFamily: 'Noto Sans'
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 20,
                    child: Text(
                      '${seller.name}',
                      style: TextStyle(
                        color: SweakaColors.primary_text,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'Noto Sans'
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(SweakaIcons.search),
                  onPressed: () {
                    print(seller.name);
                  },
                  color: SweakaColors.grey_text,
                ),
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

              /// Menu Button
              leading: IconButton(
                onPressed: () {},
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(SweakaIcons.menu),
                  color: SweakaColors.grey_text,
                ),
                
              ),


              flexibleSpace: Padding(
                padding: EdgeInsets.only(top:30),
                child: Material(
                  elevation: 0,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          /// Texte des filtres
                          Container(
                            decoration: BoxDecoration(
                              color: _backgroundColor,
                              border:
                                  Border.all(width: 2, color: SweakaColors.border_1),
                            ),
                            margin: EdgeInsets.only(top: 56),
                            height: 56,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Filtrer les résultats',
                                          style: TextStyle(
                                            color: SweakaColors.secondary_text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          )),
                                      Text('Afficher les livreurs inactifs',
                                          style: TextStyle(
                                              color: SweakaColors.secondary_text,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),

                                // Switch Button //
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: SweakaSwitch(
                                      value: true,
                                      onChanged: (value) {
                                        setState(() {
                                          _showActiveOnly = value;
                                        });
                                      print('Switch value changed to: $value');
                                    },
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
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
  padding: EdgeInsets.symmetric(horizontal: 16),
  height: MediaQuery.of(context).size.height,
  child: ListView.builder(
    shrinkWrap: false,
    itemCount: sellers.length,
    itemBuilder: (BuildContext context, int i) {
      if ( _showActiveOnly && !sellers[i].is_active!) {
        return SizedBox.shrink(); } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
          decoration: BoxDecoration(
            color: SweakaColors.primary_background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(

                children: [
                  Padding(
                    padding: EdgeInsets.only(right:10),
                    child: CircleAvatar(
                      child: Image(image: AssetImage('assets/Images/app.png')),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${sellers[i].first_name}',
                            style: SweakaText.Title,
                          ),
                           Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.circle_rounded,
                                  color: SweakaColors.success,
                                  size: 7,
                                ),
                              ),
                        ],
                      ),
                      Text('${sellers[i].phone}',
                        style: SweakaText.overline,
                      ),
                    ],
                  ),
                 
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: SweakaColors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 12.0,
                                  spreadRadius: 0,
                                  offset: Offset(0.0, 8.0),
                                ),
                              ],
                            ),
                            child: Icon(
                              SweakaIcons.more_vertical,
                              size: 20,
                              color: SweakaColors.light_text,
                            ),
                          ),
                    ),
                  ),
                  
                  
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                            children: [
                              Icon(SweakaIcons.users,size: 16, color: SweakaColors.primaryColor),
                              SizedBox(width: 3),
                              Text('${sellers[i].client_count}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.primary_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                              Text('clients',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.light_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(SweakaIcons.package, size: 16, color: SweakaColors.primaryColor),
                              SizedBox(width: 3),
                              Text('${sellers[i].product_count}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.primary_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                              Text('produits',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.light_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(SweakaIcons.shopping_bag,size: 16,color: SweakaColors.secondaryColor),
                              SizedBox(width: 3),
                              Text('${sellers[i].order_count}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.primary_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                              Text('commandes',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.light_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(SweakaIcons.cash,size: 16, color: SweakaColors.success),
                              SizedBox(width: 3),
                              Text('${sellers[i].money}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.primary_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                              Text('unit',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: SweakaColors.light_text,
                                  fontFamily: 'Noto Sans',
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
                  
              ),
            ],
          ),
        ),
      );
    };
    },
  ),
),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.only(top: 10),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: SweakaColors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour',
                        style: SweakaText.Subtitle,
                      ),
                     /**  sellers.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: sellers
                  .map(
                    (seller) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(seller.name),
                     
                    ),
                  )
                  .toList(),
            ), 
                      FutureBuilder(
                        future: SellerRepository.loadSellersOnline(),
                        builder: (context, snapshort) {
                          if (snapshort.connectionState == ConnectionState.waiting) {
                          return const Expanded(child: CircularProgressIndicator());
                        } else if (snapshort.hasData) {
                          List<Seller> name = snapshort.data!;
                          return Expanded(
                            child: Text('${seller.first_name}'),
                          );
                        }
                        return Text('haha');
                        },
                        ), */
                      Text(
                        'ahmed',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: SweakaColors.primary_text,
                            fontFamily: 'Noto Sans'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: SweakaColors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: SweakaColors.shadow_1,
                              blurRadius: 12.0,
                              spreadRadius: 0,
                              offset: Offset(0.0, 8.0),
                            ),
                          ],
                        ),
                        child: Icon(SweakaIcons.settings,
                            size: 24, color: SweakaColors.light_text),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: SweakaColors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: SweakaColors.shadow_1,
                              blurRadius: 12.0,
                              spreadRadius: 0,
                              offset: Offset(0.0, 8.0),
                            ),
                          ],
                        ),
                        child: Icon(SweakaIcons.x,
                            size: 24, color: SweakaColors.light_text),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EN BESOIN DE VOTRE ATTENTION',
                        style: SweakaText.overline),
                    SizedBox(height: 8),
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: SweakaColors.error,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(SweakaIcons.shopping_bag,
                                color: SweakaColors.white),
                            //Line divider //
                            Container(
                              height: 24, // height of the line
                              width: 1, // thickness of the line
                              color: SweakaColors.shadow_2, // color of the line
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('DEMANDE DE COMMANDE',
                                    style: SweakaText.notif_subtitle),
                                Text(
                                    '2 demandes de commande en attente de votre réponse.',
                                    style: SweakaText.notif_title)
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(SweakaIcons.chevron_right,
                                    color: SweakaColors.white))
                          ]),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: SweakaColors.alert
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(SweakaIcons.truck,
                                color: SweakaColors.white),
                            //Line divider //
                            Container(
                              height: 24, // height of the line
                              width: 1, // thickness of the line
                              color: SweakaColors.shadow_2, // color of the line
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PAIEMENT LIVREUR',
                                    style: SweakaText.notif_subtitle),
                                Text(
                                    '2 demandes de commande en attente de votre réponse.',
                                    style: SweakaText.notif_title)
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(SweakaIcons.chevron_right,
                                    color: SweakaColors.white))
                          ]),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: SweakaColors.state,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(SweakaIcons.truck, color: SweakaColors.white),
                            //Line divider //
                            Container(
                              height: 24, // height of the line
                              width: 1, // thickness of the line
                              color: SweakaColors.shadow_2, // color of the line
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PAIEMENT LIVREUR',
                                    style: SweakaText.notif_subtitle),
                                Text(
                                    '2 demandes de commande en attente de votre réponse.',
                                    style: SweakaText.notif_title)
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(SweakaIcons.chevron_right,
                                    color: SweakaColors.white))
                          ]),
                    ),
                    SizedBox(height: 8),
                  ]),
            ),
            ListTile(
              leading: Icon(
                Icons.space_dashboard_outlined,
                color: SweakaColors.grey_text,
              ),
              title: Text(
                'Dashboard',
                style: SweakaText.menu
              ),
              onTap: () async {
                await SellerRepository.loadSellersOnline();
              },
            ),
            ListTile(
              leading: Icon(
                SweakaIcons.shopping_bag,
                color: SweakaColors.grey_text,
              ),
              title: Text(
                'Liste des commandes',
                style: SweakaText.menu,
              ),
              onTap: () {
                // TODO: Add functionality here
              },
            ),
            ListTile(
              leading: Icon(
                SweakaIcons.truck,
                color: SweakaColors.grey_text,
              ),
              title: Text(
                'Liste des livreurs',
                style: SweakaText.menu,
              ),
              onTap: () {
                // TODO: Add functionality here
              },
            ),
            ListTile(
              leading: Icon(
                SweakaIcons.map,
                color: SweakaColors.grey_text,
              ),
              title: Text(
                'Gestion des secteurs',
                style: SweakaText.menu,
              ),
              onTap: () {
                // TODO: Add functionality here
              },
            ),
            ListTile(
              leading: Icon(
                SweakaIcons.users,
                color: SweakaColors.grey_text,
              ),
              title: Text(
                'Liste des clients',
                style: SweakaText.menu,
              ),
              onTap: () {
                // TODO: Add functionality here
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: SweakaColors.shadow_3,
                  onPrimary: SweakaColors.error,
                  elevation: 0,
                  minimumSize: Size(0, 56),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(SweakaIcons.log_out, color: SweakaColors.error),
                    SizedBox(width: 8),
                    Text(
                      'Déconnexion',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: SweakaColors.error,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// Add Seller Button

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: SweakaColors.secondaryColor,
        elevation: 8.0,
        highlightElevation: 12.0,
        child: Icon(SweakaIcons.user_plus),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Menu Commandes //
                        Row(
                          children: [
                            Icon(
                              SweakaIcons.package,
                              color: SweakaColors.secondary_text,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Commandes affectées',
                                  style: SweakaText.Title,
                                ),
                                Text(
                                    'Liste des commandes pour la livraison',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize: 12,
                                        color:
                                        SweakaColors.light_text)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Menu  Stock Camion //

                        Row(
                          children: [
                            Icon(
                              SweakaIcons.truck,
                              color: SweakaColors.state,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stock Camion',
                                  style: SweakaText.Title,
                                ),
                                Text(
                                    'Liste des produits dans le stock du camion',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize: 12,
                                        color:
                                        SweakaColors.light_text)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Menu reste du Stock //

                        Row(
                          children: [
                            Icon(
                              SweakaIcons.shopping_bag,
                              color: SweakaColors.error,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reste du Stock',
                                  style: SweakaText.Title,
                                ),
                                Text(
                                    'Confirmer le reste du stock du livreur',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize: 12,
                                        color:
                                        SweakaColors.light_text)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
// Menu Paiement //
                        Row(
                          children: [
                            Icon(
                              SweakaIcons.cash,
                              color: SweakaColors.success,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paiement',
                                  style: SweakaText.Title,
                                ),
                                Text('En attente de paiement',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize: 12,
                                        color:
                                        SweakaColors.light_text)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
// Menu Détail livreur //
                        Row(
                          children: [
                            Icon(
                              SweakaIcons.eye,
                              color: SweakaColors.light_text,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Détail livreur',
                                  style: SweakaText.Title
                                ),
                                Text(
                                    'Historique livreur et gestion des shifts',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w400,
                                        fontSize: 12,
                                        color:
                                        SweakaColors.light_text)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
