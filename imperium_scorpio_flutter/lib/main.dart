

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Postal/Ermes.dart';
import 'package:imperium_scorpio_flutter/database/CardDB.dart';
import 'package:flutter/services.dart';

import 'Match/UI/MatchUI.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(


      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot){
          if (snapshot.hasError){
            print('Errore!! ${snapshot.error.toString()}');
            return Text ('Qualcosa è andato storto');
          } else if (snapshot.hasData) {
            return MyHomePage();
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
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
  Ermes ermes = Ermes();



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
                        //ermes.readyToPlay("player");
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


