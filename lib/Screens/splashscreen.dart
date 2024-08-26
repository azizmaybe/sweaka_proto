import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              padding: const EdgeInsets.fromLTRB(120, 206, 120, 0),
              child: Center(
                child: Image.asset('assets/Images/appsplash.png'   
                ),
              ),
             ),
             Container(
              padding: const EdgeInsets.fromLTRB(132, 0, 131, 355),
              child: Center(
                child: Image.asset('assets/Images/namesplash.png'   
                ),
              ),
             ),
             Text(
              'Sweaka 2023. Tous les droits sont réservés',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'NoToSans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color.fromARGB(150, 186, 195, 213),
              ),
            ),
          ],
      )
     ),
    );
  }
}
