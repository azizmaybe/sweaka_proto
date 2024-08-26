import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sweaka_supervisor_2/constants/SweakaDecoration.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/SweakaTexts.dart';
import 'package:sweaka_supervisor_2/sweaka_icons_icons.dart';

import '../../constants/SweakaSwitch.dart';


class ChangeCodePIN extends StatefulWidget {
  const ChangeCodePIN({Key? key}) : super(key: key);

  @override
  State<ChangeCodePIN> createState() => _ChangeCodePIN();
}

class _ChangeCodePIN extends State<ChangeCodePIN> {

TextEditingController controller = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: 
            Container(
                width: double.infinity,
                height: 20,
                child: Text(
                  'Changer code PIN',
                  style: SweakaText.title_Client,
                ),
              ),
            
       
        backgroundColor: Colors.white,

        /// Back Button 
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(SweakaIcons.arrow_left),
              color: SweakaColors.primaryColor,
            iconSize: 30.0,
          ),
        ),
      ),
      body: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
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
                  SizedBox(height: 20),
                  Text('Veuillez entrer votre code PIN.', style: SweakaText.overline),
                  Spacer(),
                  Padding(
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: ElevatedButton(
      onPressed: () {
        // TODO: Add onPressed functionality
      },
      style: ElevatedButton.styleFrom(
        primary: SweakaColors.light_text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 46),
      ),
      child: Text(
        'Appliquer',
        style: SweakaText.button,
      ),
    ),
  ),
          ],
        ),
    
    );
  }
}
