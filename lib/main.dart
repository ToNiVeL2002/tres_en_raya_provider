import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';
import 'package:tres_en_raya_con_provider/screens/screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => JuegoProvider()),
      ],
      child: const  MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'start',
      routes: {
        'start' :         ( _ ) =>  StartingScreen(),
        'choose':         ( _ ) =>  ChooseScreen(),
        'singleplayer':   ( _ ) =>  SinglePlayerScreen(),
        'multiplayer':    ( _ ) =>  MultiPlayerScreen(),
        'desafios':       ( _ ) =>  DesafiosScreen(),
        'estilos':        ( _ ) =>  EstilosScreen(),
      },
    );
  }
}