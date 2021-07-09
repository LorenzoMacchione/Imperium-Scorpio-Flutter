

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/database/CardDB.dart';
import 'package:flutter/services.dart';

import 'Match/UI/MatchUI.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(


      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CardDB db = CardDB();


  @override
  Widget build(BuildContext context) {

    db.setDB();
    db.load();

    return Stack(
      children:<Widget>[
        Image.asset('assets/images/background_menu.jpg',
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
            body: Center(

              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                  ),
                  Text  (
                      'IMPERIUM SCORPIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'orion',
                        color: Colors.white,
                        fontSize: 75
                      ),
                  ),
                  Container(
                    height: 200,
                  ),
                  MaterialButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return MatchUI();
                          }),
                        );
                      },
                      child: Stack(
                            alignment: Alignment.center,
                            children:<Widget>[
                               Image.asset(
                                  'assets/images/new_game.png',
                                  alignment: Alignment.center,
                                  scale: 0.5,
                               ),
                                Container(
                                  child:
                                  Text(
                                    'New Game',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    )
                                  )
                                )
                            ]
                      )
                  ),
                ],
            ),
          ),
        )
      ]
    );
  }
}


