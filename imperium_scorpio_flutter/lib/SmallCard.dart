

import 'package:flutter/cupertino.dart';
import 'database/Cards.dart';

class SmallCard extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _CardState();
}

  class _CardState extends State<SmallCard> {
  Cards card = Cards();

  _CardState(){
    card.id = 1;
  }

  takeDamage(int i){
  card.hp -= i;
  if (card.hp <= 0) blank();
  }

  void blank() {
    //TODO: import from android project
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/image/card_${card.id}.png'),
      ],
    );
  }






  }


