import 'package:flutter/material.dart';
import 'package:tres_en_raya_con_provider/widgets/widgets.dart';

class SinglePlayerScreen extends StatelessWidget {
   
  const SinglePlayerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          
          children: [
            PageTitle(),

            const SizedBox(height: 46,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardProfile(color: Color(0xff1263FF), imagen: 'assets/player1.png', imagenSimbolo: 'assets/X.png', nameT: 'Jugador'),
                CardProfile(color: Color(0xffEF5F5F), imagen: 'assets/player2.png', imagenSimbolo: 'assets/circulo.png', nameT: 'Computadora'),
              ],
            ), 

            const SizedBox(height: 60,),

            _GameBody()
            
        
          ],
        ),
      )
    );
  }
}

class _GameBody extends StatelessWidget {
  const _GameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 419,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffFF0000),
            Color(0xff0080F6)
          ]
        )
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Box(),
              Box(),
              Box(),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Box(),
              Box(),
              Box(),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Box(),
              Box(),
              Box(),
            ],
          ),
        ],
      )
    );
  }
}

