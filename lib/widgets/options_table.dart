import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsTable extends StatelessWidget {
  const OptionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard( color: Color(0xffFF1212), image: 'assets/image1.png', name: 'UN JUGADOR', ),
            _SingleCard( color: Color(0xff00C2FF), image: 'assets/image2.png', name: 'DOS JUGADORES' )
          ]
        ),

        TableRow(
          children: [
            _SingleCard( color: Color(0xffFF7008), image: 'assets/image3.png', name: 'DESAFIOS', ),
            _SingleCard( color: Color(0xff1E6BFF), image: 'assets/image4.png', name: 'ESTILOS' )
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final Color color;
  final String image;
  final String name;
  
  const _SingleCard({
    super.key, 
    required this.color, 
    required this.image, 
    required this.name
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(7.5),
      height: 172,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image( 
            image: AssetImage(image),
            fit: BoxFit.contain, 
          ),

          Container(
            child: Column(
              children: [
                Container(
                  width: 126,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(height: 5,),

                Text(
                  name,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

