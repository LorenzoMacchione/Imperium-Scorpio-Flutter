///Classe che gestice l'interfaccia iniziale ed avvia il processo di matchmacking
///presente il tasto clearDB provisorio per permetterte in fase di sviluppo di pulire il database(firebase) in caso di errori

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Postal/Ermes.dart';
import 'package:imperium_scorpio_flutter/WaitingRoom.dart';
import 'package:flutter/services.dart';

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
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Errore!! ${snapshot.error.toString()}');
          return Text('Qualcosa è andato storto');
        } else if (snapshot.hasData) {
          return MyHomePage();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Ermes ermes = Ermes();
  String username = "name";

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/background_menu.jpg',
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
          Container(
            height: 80,
          ),
          Text(
            'IMPERIUM SCORPIO',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'orion', color: Colors.white, fontSize: 75),
          ),
          Container(
            height: 75,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (String? value) {
              username = value!;
            },
            decoration: const InputDecoration(
              hintText: "username",
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
              onPressed: () {
                ermes = Ermes.withContext(context);
                ermes.readyToPlay(username);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WaitingRoom();
                  }),
                );
              },
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Image.asset(
                  'assets/images/new_game.png',
                  alignment: Alignment.center,
                  scale: 0.5,
                ),
                Container(
                    child: Text('New Game',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25)))
              ])),
          ElevatedButton.icon(
            onPressed: () {
              ermes.clearDB();
            },
            icon: Icon(CupertinoIcons.refresh, color: Colors.white, size: 50),
            label: Text("clear DB"),
          )
        ])),
      ),
    ]);
  }
}
