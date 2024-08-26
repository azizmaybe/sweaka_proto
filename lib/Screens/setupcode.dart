import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sweaka_supervisor_2/Styles/bigbutton.dart';
import 'package:sweaka_supervisor_2/main.dart';
import '../constants/sweakaColors.dart';
import '../constants/sweakaText.dart';



class SetupCodePin extends StatefulWidget {
  const SetupCodePin({Key? key}) : super(key: key);

  @override
  State<SetupCodePin> createState() => _SetupCodePinState();
}

class _SetupCodePinState extends State<SetupCodePin> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: SweakaColors.primaryColor,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: const Text(
                'Ignorer',
                style: SweakaText.body_medium,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0),),
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
          SizedBox(
            height: 254,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 95.35),
            decoration: BoxDecoration(
              border: Border.all(color: SweakaColors.grey_scale_5,
              width: 5,),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                cursorColor: Colors.transparent,
                appContext: context,
                controller: controller,
                length: 4,
                enableActiveFill: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textStyle: TextStyle(
                  color: Colors.transparent
                ),
                
                
                pinTheme: PinTheme(
                  
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 12.3,
                  fieldWidth: 12.3,
                  inactiveColor: SweakaColors.secondaryColor,
                  selectedColor: SweakaColors.secondaryColor,
                  activeFillColor: SweakaColors.success,
                  selectedFillColor: SweakaColors.white,
                  activeColor: SweakaColors.success,
                  inactiveFillColor: SweakaColors.secondaryColor,
                ),
                onChanged: (value) {
                  print(value);
                },
                ),
            ),
            ),
          
            
            SizedBox(
              height: 32,
            ),
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Veuillez configurer un code PIN. Cette étape est optionnel,",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: SweakaColors.secondary_text),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "vous pouver l'ignorer et le configurez plus tards depuis la",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: SweakaColors.secondary_text),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'section paramètres.',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: SweakaColors.secondary_text),
              ),
            ),
          ),
          SizedBox(
            height: 258.63,
          ),
          ElevatedButton(
            style: buttonPrimary,
            onPressed: () {
         
            },
            child: Text('Appliquer'),
          ),
          ],
        ),
      ),
    );
  }
}

