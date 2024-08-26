import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/Screens/signin.dart';
import 'package:sweaka_supervisor_2/Screens/splashscreen.dart';

class Uivalidation extends StatelessWidget {
const Uivalidation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UI Validation',
          style: TextStyle(
            color: Color.fromARGB(255, 26, 20, 80),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [  
           TextButton(
            
           child: Text(
                "Splash Screen",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 20, 80),
                  height: 2.5,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
               style: ButtonStyle(
                  alignment: Alignment.centerLeft),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Splashscreen()));
              },
            ),
            TextButton(
           child: Text(
                "Sign In",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 20, 80),
                  height: 2.5,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              style: ButtonStyle(
                  alignment: Alignment.centerLeft),
              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signin()));

              },
            ),
            TextButton(
           child: Text(
                "Code Pin",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 20, 80),
                  height: 2.5,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              style: ButtonStyle(
                  alignment: Alignment.centerLeft),
              onPressed: () {
                
              },
            ),
            TextButton(
           child: Text(
                "Forget Password",
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 20, 80),
                  height: 2.5,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                ),
              ),
              style: ButtonStyle(
                  alignment: Alignment.centerLeft),
              onPressed: () {},
            ),
          ]),
    );
  }
}


