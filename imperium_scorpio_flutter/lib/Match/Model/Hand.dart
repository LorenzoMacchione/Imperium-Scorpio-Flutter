



import 'package:imperium_scorpio_flutter/database/Cards.dart';

class Hand{
    List<Cards> hand = [];

    addCard (Cards c){
      if (c.id!=-1){
        if (hand.length<5) {hand.add(c);}
      }
    }

    Cards read(int i) {
    return hand[i];
    }

    Cards takeCard(int i) {
      return hand.removeAt(i);
    }
}