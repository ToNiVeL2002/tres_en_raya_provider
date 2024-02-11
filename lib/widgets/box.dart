import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
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
    );
  }
}