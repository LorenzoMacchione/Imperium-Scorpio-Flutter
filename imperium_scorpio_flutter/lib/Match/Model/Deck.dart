

import 'dart:math';

import 'package:imperium_scorpio_flutter/database/CardDB.dart';
import 'package:imperium_scorpio_flutter/database/Cards.dart';

class Deck{

  List<Cards> deck=[];

  /*Deck(String code, CardDB db)  {
    for (var i=0; i<code.length;i+2) {
      String s = code.substring(i,i+1);
      deck.add( db.getCardById(int.parse(s,radix: 16)) as Cards);
    }
  }*/

  Deck(){
    deck.add(Cards.setCards(1, "Valden", 0, 2, 0, 3, "", 8, 2, 5));
    deck.add(Cards.setCards(2, "Varga", 3, 2, 0, 1, "", 5, 5, 8));
    deck.add(Cards.setCards(3, "", 0, 0, 0, 1, "", 0, 3, 1));
    deck.add(Cards.setCards(4, "", 1, 0, 0, 0, "", 3, 0, 1));
    deck.add(Cards.setCards(5, "", 3, 0, 1, 0, "", 9, 0, 3));
    deck.add(Cards.setCards(6, "", 0, 3, 1, 0, "", 0, 9, 3));
    deck.add(Cards.setCards(7, "", 0, 0, 1, 2, "", 2, 2, 5));
    deck.add(Cards.setCards(8, "", 2, 5, 3, 0, "", 3, 15, 9));
    deck.add(Cards.setCards(9, "", 0, 1, 0, 1, "", 1, 4, 2));
    deck.add(Cards.setCards(10, "", 4, 0, 10, 2, "", 12, 0, 24));
    deck.add(Cards.setCards(1, "Valden", 0, 2, 0, 3, "", 8, 2, 5));
    deck.add(Cards.setCards(2, "Varga", 3, 2, 0, 1, "", 5, 5, 8));
    deck.add(Cards.setCards(3, "", 0, 0, 0, 1, "", 0, 3, 1));
    deck.add(Cards.setCards(4, "", 1, 0, 0, 0, "", 3, 0, 1));
    deck.add(Cards.setCards(5, "", 3, 0, 1, 0, "", 9, 0, 3));
    deck.add(Cards.setCards(6, "", 0, 3, 1, 0, "", 0, 9, 3));
    deck.add(Cards.setCards(7, "", 0, 0, 1, 2, "", 2, 2, 5));
    deck.add(Cards.setCards(8, "", 2, 5, 3, 0, "", 3, 15, 9));
    deck.add(Cards.setCards(9, "", 0, 1, 0, 1, "", 1, 4, 2));
    deck.add(Cards.setCards(10, "", 4, 0, 10, 2, "", 12, 0, 24));

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