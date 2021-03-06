///Classe che estende SmallCardModel per aggiungere dati e funzioni per gestire i pianeti e le carte presenti su di essi


import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/Cards.dart';

class PlanetModel extends SmallCardModel{
  late int position;
  int danger;
  bool pRes1;
  bool pRes2;
  bool pRes3;
  bool pRes4;
  bool controlled = false;

  List<int> range1 = []; ///Array contenente gli id dei pianeti adicenti usato per gestire le interazioni

  List<bool> pRes = [];

  PlanetModel(this.position, this.danger, this.pRes1, this.pRes2, this.pRes3, this.pRes4): super(){
    pRes.add(pRes1);
    pRes.add(pRes2);
    pRes.add(pRes3);
    pRes.add(pRes4);

    switch (position) {
      case 0 : {
        range1.add(1);
        range1.add(2);
        break;
      }

      case 1 : {
        range1.add(0);
        range1.add(2);
        range1.add(3);
        range1.add(4);
        break;
      }

      case 2 : {
        range1.add(0);
        range1.add(1);
        range1.add(5);
        range1.add(4);
        break;
      }

      case 3 : {
        range1.add(6);
        range1.add(1);
        range1.add(4);
        break;
      }

      case 4 : {
      range1.add(1);
      range1.add(2);
      range1.add(3);
      range1.add(5);
      range1.add(6);
      range1.add(7);
      break;
      }

      case 5 : {
        range1.add(7);
        range1.add(2);
        range1.add(4);
        break;
      }

      case 6 : {
        range1.add(8);
        range1.add(7);
        range1.add(3);
        range1.add(4);
        break;
      }

      case 7 : {
        range1.add(8);
        range1.add(6);
        range1.add(5);
        range1.add(4);
        break;
      }

      case 8 : {
        range1.add(7);
        range1.add(6);
        break;
      }
    }
  }

  List<int> takeRes() {

  var IA = [0, 0, 0, 0];
  if (pRes[0]) IA[0] = card.mining;
  if (pRes[1]) IA[1] = card.mining;
  if (pRes[2]) IA[2] = card.mining;
  if (pRes[3]) IA[3] = card.mining;
  takeDamage(danger);

  return IA;
  }

  void moveTo(SmallCardModel c){
    newCard(c.card);
    hp = c.hp;
    name = c.name;
    res1 = c.res1;
    res2 = c.res2;
    res3 = c.res3;
    res4 = c.res4;
    attack = c.attack;
    mining = c.mining;
    player = c.player;
    controlled = true;
  }

  void CardmoveTo(Cards c){
    newCard(c);
    hp = c.hp;
    name = c.name;
    res1 = c.res1;
    res2 = c.res2;
    res3 = c.res3;
    res4 = c.res4;
    attack = c.attack;
    mining = c.mining;
    player = c.player;
    controlled = true;
  }

  SmallCardModel moveFrom(){
    SmallCardModel c = copy();
    blank();
    controlled = false;
    return c;
  }


}