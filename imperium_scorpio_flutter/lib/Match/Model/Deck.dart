

import 'dart:math';

import 'package:imperium_scorpio_flutter/database/CardDB.dart';
import 'package:imperium_scorpio_flutter/database/Cards.dart';

class Deck{

  List<Cards> deck=[];

  Deck(String code, CardDB db)  {
    for (var i=0; i<code.length;i+2) {
      String s = code.substring(i,i+1);
      deck.add( db.getCardById(int.parse(s,radix: 16)) as Cards);
    }
  }

  Cards draw (){
    if (deck.length>0){
      int i = Random().nextInt(deck.length);
      Cards c = deck.removeAt(i);
      return c;
    }
    Cards c = Cards();
    return c;
  }
}