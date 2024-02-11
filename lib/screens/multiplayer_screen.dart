import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';
import 'package:tres_en_raya_con_provider/widgets/widgets.dart';

class MultiPlayerScreen extends StatelessWidget {
   
  const MultiPlayerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          
          children: [
            PageTitle(),

            const SizedBox(height: 46,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardProfile(color: Color(0xff1263FF), imagen: 'assets/player1.png', imagenSimbolo: 'assets/X.png', nameT: 'Jugador1'),
                CardProfile(color: Color(0xffEF5F5F), imagen: 'assets/player2.png', imagenSimbolo: 'assets/circulo.png', nameT: 'Jugador2'),
              ],
            ), 

            const SizedBox(height: 60,),

            _GameBody(),
            
            const SizedBox(height: 10,)
        
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

    final juegoProvider = Provider.of<JuegoProvider>(context);

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

      child: _Positions(juegoProvider: juegoProvider)
    );
  }
}

class _Positions extends StatelessWidget {
  const _Positions({
    super.key,
    required this.juegoProvider,
  });

  final JuegoProvider juegoProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box1');
                juegoProvider.changeState('box1');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box1'], imagen: juegoProvider.positionMap['box1'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box2');
                juegoProvider.changeState('box2');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box2'], imagen: juegoProvider.positionMap['box2'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box3');
                juegoProvider.changeState('box3');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box3'], imagen: juegoProvider.positionMap['box3'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box4');
                juegoProvider.changeState('box4');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box4'], imagen: juegoProvider.positionMap['box4'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box5');
                juegoProvider.changeState('box5');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box5'], imagen: juegoProvider.positionMap['box5'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box6');
                juegoProvider.changeState('box6');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box6'], imagen: juegoProvider.positionMap['box6'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box7');
                juegoProvider.changeState('box7');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box7'], imagen: juegoProvider.positionMap['box7'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box8');
                juegoProvider.changeState('box8');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box8'], imagen: juegoProvider.positionMap['box8'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoProvider.changePositionMap('box9');
                juegoProvider.changeState('box9');
                
              },
    
              child: Box(disponible: juegoProvider.boxState['box9'], imagen: juegoProvider.positionMap['box9'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
      ],
    );
  }
}