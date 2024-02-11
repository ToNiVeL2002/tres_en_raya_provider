import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  
  final String? imagen;
  final bool disponible;

  Box({
    super.key, 
    this.imagen, 
    required this.disponible
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Visibility(
        visible: imagen != null && !disponible,
        child: Image.asset(imagen ?? 'assets/image1.png')
      )
    );
  }
}