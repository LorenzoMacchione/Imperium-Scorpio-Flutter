

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_loading/widget_loading.dart';

class WaitingRoom extends StatelessWidget{

  @override


  Widget build (BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background_menu.jpg',fit: BoxFit.fill),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Waiting Player",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "orion",
                    color: Colors.white,
                    fontSize: 100
                  ),
                ),
                CircularWidgetLoading(
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                  dotColor: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    );


  }
}