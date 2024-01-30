import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SimplePageTitle extends StatelessWidget {
  
  final String titulo;
  final double width;
  final double height;

  const SimplePageTitle({
    super.key, 
    required this.titulo, 
    required this.width, 
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                titulo,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 24
                ),
              ),
          
              const SizedBox(height: 20,),
          
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Color(0xffFF1212),
                  borderRadius: BorderRadius.circular(20)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}