import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingScreen extends StatelessWidget {
   
  const StartingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _textoPersonalizado(),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Simbolo(dirImagen: 'assets/X.png', width: 100, height: 100),

              SizedBox(width: 30,),

              _Simbolo(dirImagen: 'assets/circulo.png', width: 100, height: 100)
            ],
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shadowColor: MaterialStateProperty.all(Colors.black),
              elevation: MaterialStateProperty.all(5),
              overlayColor: MaterialStateProperty.all(Colors.purple.shade800),
            ),
            onPressed: () {

              Navigator.pushNamed(context, 'choose');

            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: Text(
                'Jugar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  RichText _textoPersonalizado() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 58,
            fontWeight: FontWeight.bold,
          )
        ),
        children: const [
          TextSpan(text: 'T', style: TextStyle(color: Color(0xff00FFFF)) ),
          TextSpan(text: 'r', style: TextStyle(color: Color(0xffFFD600)) ),
          TextSpan(text: 'e', style: TextStyle(color: Color(0xffFF0000)) ),
          TextSpan(text: 's\n', style: TextStyle(color: Color(0xff00FFFF)) ),
          TextSpan(text: 'e', style: TextStyle(color: Color(0xffFFD600)) ),
          TextSpan(text: 'n\n', style: TextStyle(color: Color(0xffFF0000)) ),
          TextSpan(text: 'r', style: TextStyle(color: Color(0xff00FFFF)) ),
          TextSpan(text: 'a', style: TextStyle(color: Color(0xffFFD600)) ),
          TextSpan(text: 'y', style: TextStyle(color: Color(0xffFF0000)) ),
          TextSpan(text: 'a', style: TextStyle(color: Color(0xff00FFFF)) ),
        ]
      ),
    );
  }
}

class _Simbolo extends StatelessWidget {

  final String dirImagen;
  final double width;
  final double height;

  const _Simbolo({
    super.key, 
    required this.dirImagen, 
    required this.width, 
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage( dirImagen ),
      width: width,
      height: height,
    );
  }
}