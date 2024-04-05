import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';
import 'package:tres_en_raya_con_provider/screens/screens.dart';
import 'package:tres_en_raya_con_provider/shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => JuegoProvider()),
        ChangeNotifierProvider(create: ( _ ) => JuegoMiniMaxProvider()),
        ChangeNotifierProvider(create: ( _ ) => UIProvider( isDarkMode: Preferences.isDarkMode ))
      ],
      child: const  MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

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
      theme: uiProvider.theme
    );
  }
}