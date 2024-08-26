import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/ClientDashboard.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20List%20Screens/ClientListScreen.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20Transanctions%20&%20Orders/ClientOrder.dart';
import 'package:sweaka_supervisor_2/Screens/Client%20Transanctions%20&%20Orders/ClientTransactions.dart';
import 'package:sweaka_supervisor_2/Screens/DashboardScreens/DashboardScreen.dart';
import 'package:sweaka_supervisor_2/Screens/Manage%20Region%20Screens/ManageRegionScreen.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20List%20Screens/SellerDashboard.dart';
import 'package:sweaka_supervisor_2/Screens/sellerDetailScreen.dart';
import 'package:sweaka_supervisor_2/Screens/Seller List Screens/AddSeller.dart';
import 'package:sweaka_supervisor_2/Screens/Seller%20Details%20Screens/SellerDetailsScreen.dart';
import 'package:sweaka_supervisor_2/Screens/Seller List Screens/SellerListScreen.dart';
import 'package:sweaka_supervisor_2/Screens/sellerStockScreen.dart';
import 'Screens/Orders, Settings & Notifications Screens/Settings.dart';
import 'Screens/splashscreen.dart';
import 'Screens/setupcode.dart';
import 'Screens/forgetpassword.dart';
import 'Screens/signin.dart';
import 'Screens/orderListScreen.dart';
import 'package:flutter/services.dart';


void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Validation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 42, 48, 73),
          ),
        ),
        primaryColor: Color.fromARGB(255, 42, 48, 73),
        secondaryHeaderColor: Color.fromARGB(255, 90, 99, 133),
        fontFamily: 'NoToSans',
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'UI Validation',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 42, 48, 73),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              TextButton(
                child: Text(
                  "Splash Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Splashscreen()));
                },
              ),
              TextButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Signin()));
                },
              ),
              TextButton(
                child: Text(
                  "Code Pin",
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SetupCodePin()));
                },
              ),
              TextButton(
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Forgetpassword()));
                },
              ),
              TextButton(
                child: Text(
                  "Seller List Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SLS()));
                },
              ),
              TextButton(
                child: Text(
                  "Add Seller Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddSeller()));
                },
              ),
              TextButton(
                child: Text(
                  "Seller Details Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SellerDetails()));
                },
              ),
              TextButton(
                child: Text(
                  "Seller stock screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerStockScreen()));
                },
              ),
              TextButton(
                child: Text(
                  "Client List Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ClientListScreen()));
                },
              ),

            TextButton(
            
           child: Text(
                "Order List Screen",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 48, 73),
                  height: 2.5,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
               style: ButtonStyle(
                  alignment: Alignment.centerLeft),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderListScreen()));
              },
            ),
              TextButton(
                child: Text(
                  "Manage Region Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ManageRegionScreen()));
                },
              ),
              TextButton(
                child: Text(
                  "Client Transactions Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ClientTransactionsScreen()));
                },
              ),
           

              TextButton(
                child: Text(
                  "Seller Detail Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerDetailScreen()));
                },
              ),
              TextButton(
                child: Text(
                  "Client Orders Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ClientOrdersScreen()));
                },
              ),

              TextButton(
      
             child: Text(
                  "Client DashBoard",

                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ClientDashboard()));
                },
              ),

              TextButton(
      
             child: Text(
                  "Seller DashBoard",

                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SellerDashboard()));
                },
              ),

              
              TextButton(
      
             child: Text(
                  "Settings",

                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
                },
              ),

              TextButton(
                child: Text(
                  "Dashboard Screen",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 48, 73),
                    height: 2.5,
                    fontSize: 18.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DashboardScreen()));
                },
              ),
      
              
             
            ]),
      

               
          ),
    );
  }
}
