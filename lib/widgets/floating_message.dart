import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tres_en_raya_con_provider/provider/provider.dart';

class FloatingMessage extends StatelessWidget {
  
  final String ganador;

  const FloatingMessage({
    super.key, 
    required this.ganador
  });


  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final juegoProvider = Provider.of<JuegoProvider>(context);

    return Container(
      width: screenSize.width*0.85,
      height: screenSize.height*0.6,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255,112,8, 10),
        borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            juegoProvider.resultado,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  juegoProvider.isWinner=false;
                  juegoProvider.resetStates();
                }, 
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(
                    'Revancha',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0057FF)
                    )
                  ),
                )
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                  juegoProvider.isWinner=false;
                }, 
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Salir',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0057FF)
                    )
                  ),
                  
                )
              ),
            ],
          )

        ],
      ),
    );
  }
}