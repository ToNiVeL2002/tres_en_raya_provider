import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProfile extends StatelessWidget {

  final Color color;
  final String imagen;
  final String imagenSimbolo;
  final String nameT;

  const CardProfile({
    super.key, 
    required this.color, 
    required this.imagen,
    required this.imagenSimbolo, 
    required this.nameT, 
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 121,
      height: 177,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image( image: AssetImage( imagen ), ),

          _SimpleTitle(name: nameT,),

          Image(
            image: AssetImage( imagenSimbolo ),
            width: 28, 
            height: 40,
          )
        ],
      ),
    );
  }
}

class _SimpleTitle extends StatelessWidget {

  final String name;  

  const _SimpleTitle({
    super.key, 
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
          ),
        ),

        Container(
          width: 90,
          height: 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
        )
      ],
    );
  }
}
