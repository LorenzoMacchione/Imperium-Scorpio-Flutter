
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

Ermes();

Ermes.withContext(BuildContext context){
  this.context = context;
}

Ermes.match(BuildContext context, Enemy enemy){
  this.context = context;
  this.enemy = enemy;
}

void lock(){ Lock = true;}
void unlock(){Lock = false;}


  //Ermes for game queue
  void readyToPlay(String user/*, wait:Waiting_Room*/){
  final dbWaiting = dbRoot.child('wait');
  dbWaiting.push().set(user);

  dbWaiting.onChildAdded.listen((event) {
    final readyUser = event.snapshot.value;
    if (!(user==readyUser)){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MatchUI(user,readyUser);
      }));
    }
  });
  }


  // Ermes for match
  void setGame(String player, String enemyName){
    // initialization database
    dbPlayer = dbRoot.child("game/$player");
    dbEnemy = dbRoot.child("game/$enemyName");

    //match listener
    dbPlayer.onChildAdded.listen((event) {
      Map result = Map();
      result.addAll(event.snapshot.value);
      var model = result.remove("model");
      if (model!="random") unlock();
      switch (model){
        case 'random':
          {
            var enemyIni = result.remove("result");
            if (initiative < enemyIni)  break;
            if (initiative > enemyIni) unlock(); break;
            randomMsg();
            break;
          }
        case 'attack': enemy.attack(result.remove("striker"), result.remove("defender")); break;
        case 'draw' : enemy.draw(result.remove("res")); break;
        case 'mining': enemy.mining(result.remove("value")); break;
        case 'playCard': enemy.move(result.remove("from"), result.remove("to")); break;
      }

    });

    randomMsg();

  }

  void randomMsg(){
    initiative = Random().nextInt(100);
    dbPlayer.push().set({'model':'random','result':initiative});
  }

  void attackMsg(int a, int d){
    dbPlayer.push().set({'model':'attack','striker':a,'defender':d});
  }

  void drawMsg(int i){
  dbPlayer.push().set({'model':'draw','res':i});
  }

  void miningMsg(int i){
  dbPlayer.push().set({'model':'mining','value':i});
  }

  void playCardMsg(int planet, int id){
  dbPlayer.push().set({'model':'playCard','onPlanet':planet,'card':id});
  }

  void moveMsg(int from, int to){
  dbPlayer.push().set({'model':'move','from':from,'to':to});
  }
}