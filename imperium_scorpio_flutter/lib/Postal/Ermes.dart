



import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'MessageModel/RandomModel.dart';

class Ermes{

final dbRoot = FirebaseDatabase(databaseURL:"https://imperium-scorpio-flutter-default-rtdb.europe-west1.firebasedatabase.app/").reference();
late final DatabaseReference dbPlayer;





  void readyToPlay(String user/*, wait:Waiting_Room*/){
  final dbWaiting = dbRoot.child('wait');
  //dbWaiting.addChildEventListener(WaitingRoomListener(wait,user));
  dbWaiting.push().set(user);

  dbWaiting.onChildAdded.listen((event) {
    final readyuser = event.snapshot.value;
    if (!(user==readyuser)){

    }
  });
  }

  void setGame(String player, String enemy){
    dbPlayer = dbRoot.child("game");
    dbPlayer.onChildAdded.listen((event) {
      Map result = Map();
      result.addAll(event.snapshot.value);
      var model = result.remove("model");
    });
    //dbRoot.reference.child("game/$enemy").addChildEventListener(MatchListener(mvm,cardDAO!!,this))
    randomModel();

  }

  void randomModel(){
    var initiative = Random().nextInt(100);
    dbPlayer.push().set({'model':'random','result':initiative});
  }

}