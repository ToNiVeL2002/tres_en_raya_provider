import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';
import 'package:tres_en_raya_con_provider/shared_preferences/preferences.dart';

class EstilosScreen extends StatelessWidget {
   
  const EstilosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);
    // bool? value = uiProvider.getBool();

    return Scaffold(
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Toca aqui',
              style: GoogleFonts.alata(
                textStyle: TextStyle(
                  fontSize: 90
                )
              ),
            ),

            IconButton(
              onPressed: () {
                Preferences.isDarkModee = !Preferences.isDarkMode;

                Preferences.isDarkMode
                ? uiProvider.setDarkMode()
                : uiProvider.setLightMode();
              },
              icon: Preferences.isDarkMode
              ? Icon(Icons.wb_sunny_outlined, size: 250,)
              : Icon(Icons.nightlight_outlined, size: 250,)
            )
          ],
         ),
      ),
    );
  }
}