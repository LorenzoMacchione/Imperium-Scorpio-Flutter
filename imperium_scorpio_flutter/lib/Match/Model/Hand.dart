///Collezione di SmallCardModel per la gestione della mano del giocatore


import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/Cards.dart';

class Hand{
    List<SmallCardModel> hand = [];

    Hand(){
      SmallCardModel hc1 = SmallCardModel();
      SmallCardModel hc2 = SmallCardModel();
      SmallCardModel hc3 = SmallCardModel();
      SmallCardModel hc4 = SmallCardModel();
      SmallCardModel hc5 = SmallCardModel();
      hand.add(hc1);
      hand.add(hc2);
      hand.add(hc3);
      hand.add(hc4);
      hand.add(hc5);
    }

    addCard (Cards c){
      if (c.id!=-1){
          for(var i=0;i<5;i++) {
            if (hand[i].hp == -1) {
              hand[i].newCard(c);
              return;
            }
          }
      }
    }


    SmallCardModel read(int i) {
    return hand[i];
    }

    Cards readCard(int i){
      return hand[i].read();
    }

    Cards takeCard(int i) {
      var c = hand[i].read();
      for(;i<4;i++){
        hand[i].newCard(hand[i+1].read());
        hand[i+1].blank();
      }
      return c;
    }
}