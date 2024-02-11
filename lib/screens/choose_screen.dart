import 'package:flutter/material.dart';

import 'package:tres_en_raya_con_provider/widgets/widgets.dart';

class ChooseScreen extends StatelessWidget {
   
  const ChooseScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            SimplePageTitle(titulo: 'Elije un modo', width: 136, height: 10,),

            SizedBox(height: 95,),

            OptionsTable()
          ],
        ),
      )
    );
  }
}





