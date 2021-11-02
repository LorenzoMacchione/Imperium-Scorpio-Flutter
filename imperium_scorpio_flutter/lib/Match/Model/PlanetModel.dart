


import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/database/Cards.dart';

class PlanetModel extends SmallCardModel{
  late int position;
  int danger;
  bool pRes1;
  bool pRes2;
  bool pRes3;
  bool pRes4;
  bool controlled = false;

  List<int> range1 = [];

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

  void moveTo(Cards c){
    newCard(c);
    controlled = true;
  }

  Cards moveFrom(){
    Cards c = card;
    blank();
    controlled = false;
    return c;
  }


}