


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Intro{

  

  Widget intro(BuildContext context){
    return MaterialButton(onPressed: (){
      Navigator.pop(context);
    },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                  ),
                  Image.asset('assets/image/logo.png')
                ],
              )
            )
          )
        ],
      )
    );
  }
}