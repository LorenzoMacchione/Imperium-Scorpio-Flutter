

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Intro.dart';
import 'package:imperium_scorpio_flutter/SmallCard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: MyHomePage(title: 'Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

     Intro intro = Intro();
    return Stack(
      children:<Widget>[
        Image.asset('assets/image/background_menu.jpg'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context){ return intro.intro(context);}));
                      },
                      child:
                          Stack(
                            alignment: Alignment.center,
                            children:<Widget>[
                               Image.asset(
                                  'assets/image/new_game.png',
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
                  SmallCard()
                ],
            ),
          ),
        )
      ]
    );
  }
}
