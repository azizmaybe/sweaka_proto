import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';
import '../constants/sweakaColors.dart';
import '../constants/sweakaText.dart';


class SellerStockScreen extends StatefulWidget {
  const SellerStockScreen({Key? key}) : super(key: key);

  @override
  _SellerStockScreenState createState() => _SellerStockScreenState();
}

class _SellerStockScreenState extends State<SellerStockScreen> {
  var _controller = TextEditingController();
  bool? _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: SweakaColors.primaryColor
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stock livreur',
                style: SweakaText.body_medium,
              ),
              Text(
                '22 produits',
                style: SweakaText.overline,
              )
            ],
          ),
          actions: <Widget>[
            ProfilePicture(
              name: 'Hubert Blaine Wolfeschlegelsteinhausenbergerdorff Sr.',
              radius: 12,
              fontsize: 10,
              random: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ], systemOverlayStyle: SystemUiOverlayStyle.dark),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 40,
              width: 380,
              child: Row(
                children: [
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
                        hintText: 'Nom du produit',
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
                  SizedBox(
                    width: 0,
                  ),
                  IconButton(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    iconSize: 24,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                              bottom: Radius.circular(12),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.transparent,
                              height: 207,
                              width: 320,
                              child: ListView(
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Filter stock',
                                      style:SweakaText.body_medium,
                                    ),
                                    subtitle: Text(
                                      'Liste des options',
                                      style: SweakaText.overline,
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        SweakaIcons.trash_2,
                                        color:
                                            SweakaColors.light_text,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      tileColor:
                                          SweakaColors.grey_scale_6,
                                      title: Text(
                                        'Tous les catégories',
                                        style: SweakaText.body_medium
                                      ),
                                      subtitle: Text(
                                        'Cliquer pour sélectionner une catégorie',
                                        style: TextStyle(
                                            color: SweakaColors.light_text,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                  top: Radius.circular(12),
                                                  bottom: Radius.circular(12),
                                                ),
                                              ),
                                              builder: (BuildContext context) {
                                                return FractionallySizedBox(
                                                  heightFactor: 0.9,
                                                  child: ListView(
                                                    // mainAxisSize: MainAxisSize.max,
                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ListTile(
                                                        title: Text(
                                                          'Tous les catégories',
                                                          style: SweakaText.body_medium
                                                        ),
                                                        subtitle: Text(
                                                          '22 catégories',
                                                          style: SweakaText.overline
                                                        ),
                                                        trailing: IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            SweakaIcons.trash_2,
                                                            color: SweakaColors.light_text
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        height: 40,
                                                        width: 380,
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
                        hintText: 'Nom du produit',
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
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 16, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:SweakaColors.grey_scale_6,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color:SweakaColors.primaryColor
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              Colors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        248,
                                                                        136,
                                                                        89),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        120,
                                                                        186,
                                                                        195,
                                                                        213),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  isScrollControlled:
                                                                      true,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              12),
                                                                      bottom: Radius
                                                                          .circular(
                                                                              12),
                                                                    ),
                                                                  ),
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return FractionallySizedBox(
                                                                      heightFactor:
                                                                          0.9,
                                                                      child:
                                                                          ListView(
                                                                        // mainAxisSize: MainAxisSize.max,
                                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          ListTile(
                                                                            title:
                                                                                Text(
                                                                              'Boissons',
                                                                              style: TextStyle(color: Color.fromARGB(255, 42, 48, 73), fontSize: 14.0, fontWeight: FontWeight.w600),
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              '4 Sous-catégories',
                                                                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Color.fromARGB(155, 90, 99, 133)),
                                                                            ),
                                                                            trailing:
                                                                                IconButton(
                                                                              onPressed: () {},
                                                                              icon: Icon(
                                                                                SweakaIcons.trash_2,
                                                                                color: Color.fromARGB(100, 161, 158, 188),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            margin: EdgeInsets.fromLTRB(
                                                                                12,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                380,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _controller,
                                                                              cursorColor: Colors.grey,
                                                                              decoration: InputDecoration(
                                                                                filled: true,
                                                                                fillColor: Color.fromARGB(255, 247, 249, 253),
                                                                                prefixIcon: Icon(
                                                                                  SweakaIcons.search,
                                                                                  color: SweakaColors.secondaryColor
                                                                                ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    width: 1,
                                                                                    color: Color.fromARGB(100, 161, 158, 188),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                focusedBorder: UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color.fromARGB(50, 82, 84, 87),
                                                                                  ),
                                                                                ),
                                                                                hintText: 'Chercher sous-catégorie',
                                                                                hintStyle: TextStyle(
                                                                                  color: Color.fromARGB(50, 82, 84, 87),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w400,
                                                                                ),
                                                                                suffixIcon: IconButton(
                                                                                  onPressed: _controller.clear,
                                                                                  icon: Icon(SweakaIcons.x_circle),
                                                                                  color: Color.fromARGB(100, 161, 158, 188),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Card(
                                                                            margin: EdgeInsets.fromLTRB(
                                                                                12,
                                                                                16,
                                                                                12,
                                                                                0),
                                                                            elevation:
                                                                                0,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                                            child:
                                                                                CheckboxListTile(
                                                                              title: const Text(
                                                                                'Boissons gazeuses',
                                                                                style: TextStyle(color: Color.fromARGB(255, 42, 48, 73), fontSize: 14.0, fontWeight: FontWeight.w600),
                                                                              ),
                                                                              value: _isChecked,
                                                                              onChanged: (bool? newValue) {
                                                                                setState(() {
                                                                                  _isChecked = newValue;
                                                                                });
                                                                              },
                                                                              activeColor: Color.fromARGB(255, 248, 136, 89),
                                                                              tileColor: Colors.transparent,
                                                                              checkColor: Colors.white,
                                                                              subtitle: const Text(
                                                                                '4 produits',
                                                                                style: TextStyle(color: Color.fromARGB(120, 186, 195, 213), fontSize: 12.0, fontWeight: FontWeight.w400),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  });
                                                            },
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      248,
                                                                      136,
                                                                      89),
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                     Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                      Card(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                12, 0, 12, 0),
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: ListTile(
                                                          //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          tileColor:
                                                              SweakaColors.white,
                                                          title: Text(
                                                            'Boissons',
                                                            style: SweakaText.body_medium
                                                          ),
                                                          subtitle: Text(
                                                            '4 sous-catégories',
                                                            style: TextStyle(
                                                                color: SweakaColors.secondary_text,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              SweakaIcons
                                                                  .chevron_right,
                                                              color: SweakaColors.primary_text
                                                            ),
                                                          ),
                                                          dense: true,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          SweakaIcons.chevron_right,
                                          color:
                                              Color.fromARGB(255, 42, 48, 73),
                                        ),
                                      ),
                                      dense: true,
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: SwitchListTile(
                                      //contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      title: Text(
                                        'Commandes',
                                        style: SweakaText.body_medium
                                      ),
                                      subtitle: Text(
                                        'Afficher les produits des commandes',
                                        style: TextStyle(
                                            color: SweakaColors.secondary_text,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      dense: true,
                                      onChanged: (bool value) {},
                                      value: true,
                                      activeColor:
                                          SweakaColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    icon: const Icon(SweakaIcons.sliders),
                    color: SweakaColors.primaryColor,
                    splashRadius: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  isThreeLine: true,
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.asset('assets/Images/juice.png',
                        fit: BoxFit.cover),
                  ),
                  title: Text(
                    'Rita - Orange juice',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    'Boisson - Bouteille',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: SweakaColors.light_text),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '4      ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 236, 239, 244),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        '      6',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  dense: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
