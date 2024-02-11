import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Tres en raya',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: const Color(0xff0057FF)
                ),
              ),

              const SizedBox(height: 8,),

              Container(
                width: 285,
                height: 12,
                decoration: BoxDecoration(
                  color: Color(0xffFF0000),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}