import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';
import 'package:tres_en_raya_con_provider/widgets/widgets.dart';

class SinglePlayerScreen extends StatelessWidget {
   
  const SinglePlayerScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final juegoMiniMaxProvider = Provider.of<JuegoMiniMaxProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          _Body(),

          juegoMiniMaxProvider.winner
            ? Align(
                alignment: Alignment.center,
                child: FloatingMessage(ganador: '',),
              )
            : Container()
          
        ],
      )
    );
  }
}

class _Body extends StatelessWidget {
  _Body({super.key,});

  @override
  Widget build(BuildContext context) {

  final juegoMiniMaxProvider = Provider.of<JuegoMiniMaxProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        
        children: [
          PageTitle(),
    
          const SizedBox(height: 46,),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardProfile(color: const Color(0xff1263FF), imagen: 'assets/player1.png', imagenSimbolo: 'assets/X.png', nameT: 'Jugador1', width: juegoMiniMaxProvider.playerTurn ? 151 : 121, height: juegoMiniMaxProvider.playerTurn ? 207 : 177,),
              CardProfile(color: const Color(0xffEF5F5F), imagen: 'assets/player2.png', imagenSimbolo: 'assets/circulo.png', nameT: 'Jugador2', width: !juegoMiniMaxProvider.playerTurn ? 151 : 121, height: !juegoMiniMaxProvider.playerTurn ? 207 : 177,),
            ],
          ), 
    
          const SizedBox(height: 60,),
    
          _GameBody(),
          
          const SizedBox(height: 10,)
      
        ],
      ),
    );
  }
}

class _GameBody extends StatelessWidget {
  const _GameBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final juegoMiniMaxProvider = Provider.of<JuegoMiniMaxProvider>(context);

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

      child: _Positions(juegoMiniMaxProvider: juegoMiniMaxProvider)
    );
  }
}

class _Positions extends StatelessWidget {
  const _Positions({
    super.key,
    required this.juegoMiniMaxProvider,
  });

  final JuegoMiniMaxProvider juegoMiniMaxProvider;

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
                if (juegoMiniMaxProvider.playerTurn && juegoMiniMaxProvider.boxState['box1']) {
                  juegoMiniMaxProvider.changePositionMap('box1');
                  juegoMiniMaxProvider.changeState('box1');
                  juegoMiniMaxProvider.fineTheWinner();
                  if (!juegoMiniMaxProvider.winner) {
                    // Llamar a la función de la IA para que haga su movimiento
                    // juegoMiniMaxProvider.
                    // juegoMiniMaxProvider.makeAIMove();
                  }
                }
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box1'], imagen: juegoMiniMaxProvider.positionMap['box1'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box2');
                juegoMiniMaxProvider.changeState('box2');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box2'], imagen: juegoMiniMaxProvider.positionMap['box2'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box3');
                juegoMiniMaxProvider.changeState('box3');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box3'], imagen: juegoMiniMaxProvider.positionMap['box3'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box4');
                juegoMiniMaxProvider.changeState('box4');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box4'], imagen: juegoMiniMaxProvider.positionMap['box4'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box5');
                juegoMiniMaxProvider.changeState('box5');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box5'], imagen: juegoMiniMaxProvider.positionMap['box5'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box6');
                juegoMiniMaxProvider.changeState('box6');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box6'], imagen: juegoMiniMaxProvider.positionMap['box6'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box7');
                juegoMiniMaxProvider.changeState('box7');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box7'], imagen: juegoMiniMaxProvider.positionMap['box7'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box8');
                juegoMiniMaxProvider.changeState('box8');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box8'], imagen: juegoMiniMaxProvider.positionMap['box8'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
            GestureDetector(
              onTap: () { 
                juegoMiniMaxProvider.changePositionMap('box9');
                juegoMiniMaxProvider.changeState('box9');
                juegoMiniMaxProvider.fineTheWinner();
                
              },
    
              child: Box(disponible: juegoMiniMaxProvider.boxState['box9'], imagen: juegoMiniMaxProvider.positionMap['box9'] ? 'assets/X.png' : 'assets/circulo.png',),
            ),
          ],
        ),
      ],
    );
  }
}

