///Classe che gestisce il passagio di informazioni tra i giocatori


import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Match/Model/Enemy.dart';
import 'package:imperium_scorpio_flutter/Match/UI/MatchUI.dart';

class Ermes{

final dbRoot = FirebaseDatabase(databaseURL:"https://imperium-scorpio-flutter-default-rtdb.europe-west1.firebasedatabase.app/").reference();
late final DatabaseReference dbPlayer;
late final DatabaseReference dbEnemy;
late BuildContext context;
late Enemy enemy;
int initiative =0;
bool Lock = true;

  String turn = "";

Ermes();

Ermes.withContext(BuildContext context){
  this.context = context;
}

Ermes.match(Enemy enemy){
  this.enemy = enemy;
}

void lock(){Lock = true;turn="ENEMY TURN";}
void unlock(){Lock = false;turn="PLAYER TURN";}


  void clearDB(){
  dbRoot.remove();
  }

  void clearMatch(){
    dbPlayer.remove();
  }

/// funzione che gestisce il match making sfruttando username diversi dei giocatori (Possibile errore se due giocatori
/// hanno lo stesso nickname, risolvibile associano ai giocatori un id progressivo)
  void readyToPlay(String user){
  final dbWaiting = dbRoot.child('wait');
  dbWaiting.push().set(user);

  dbWaiting.onChildAdded.listen((event) {
    final readyUser = event.snapshot.value;
    if (!(user==readyUser)){
      dbWaiting.remove();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MatchUI(user,readyUser);
      }));
    }
  });
  }


  ///funzione per inizializzare e gestire la partita
  void setGame(String player, String enemyName){
    // initialization database
    dbPlayer = dbRoot.child("game/$player");
    dbEnemy = dbRoot.child("game/$enemyName");

    //match listener
    dbEnemy.onChildAdded.listen((event) {
      Map result = Map();
      result.addAll(event.snapshot.value);
      var model = result.remove("model");
      if (model!="random") unlock();
      switch (model){
        case 'random':
          {
            var enemyIni = result.remove("result");
            if (initiative < enemyIni)  break;
            if (initiative > enemyIni){unlock(); break;}
            randomMsg();
            break;
          }
        case 'attack':{ enemy.attack(result.remove("striker"), result.remove("defender")); break;}
        case 'draw' : {enemy.draw(result.remove("res"));break;}
        case 'mining': {enemy.mining(result.remove("value"));break;}
        case 'move':{ enemy.move(result.remove("from"), result.remove("to"));break;}
        case 'playCard':{enemy.playCard(result.remove("onPlanet"), result.remove("card"));break;}
      }

    });

    randomMsg();

  }


///messaggi inviati dal giocatore del dispositivo
  void randomMsg(){
    initiative = Random().nextInt(100);
    dbPlayer.push().set({'model':'random','result':initiative});
  }

  void attackMsg(int a, int d){
    dbPlayer.push().set({'model':'attack','striker':(a-8).abs(),'defender':(d-8).abs()});
  }

  void drawMsg(int i){
  dbPlayer.push().set({'model':'draw','res':i});
  }

  void miningMsg(int i){
  dbPlayer.push().set({'model':'mining','value':(i-8).abs()});
  }

  void playCardMsg(int planet, int id){
  dbPlayer.push().set({'model':'playCard','onPlanet':(planet-8).abs(),'card':id});
  }

  void moveMsg(int from, int to){
  dbPlayer.push().set({'model':'move','from':(from-8).abs(),'to':(to-8).abs()});
  }
}