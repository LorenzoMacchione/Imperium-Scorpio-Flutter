


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';

import 'SmallCard.dart';

class Planet extends StatefulWidget {

  SmallCardModel card;
  Planet({
    required this.card});

  @override
  State<StatefulWidget> createState() => _PlanetState(card);
}

class _PlanetState extends State {
  late SmallCardModel card;

  void takeDamage(int i){
    setState(() {
      card.takeDamage(i);
    });
  }

  _PlanetState(SmallCardModel card){
    this.card = card;
  }
  @override
  Widget build(BuildContext context) {
    return
      Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/ice.png',
              scale: 0.5,
              width: 85,
              height: 85,
            ),
            Visibility(
              child:SmallCard(
                card: card,
                width: 56,
                height: 70,
              ),
              visible: card.hp!=-1,
            ),
            Visibility(
              visible: false,
              child: Image.asset('assets/images/anello_verde.png', scale: 0.94),
            ),
            Visibility(
              visible: false,
              child: Image.asset('assets/images/anello_giallo.png', scale: 0.94),
            ),
            Visibility(
                visible: false,
                child: MaterialButton(
                  onPressed: () { takeDamage(1);},
                  child: Image.asset('assets/images/anello_rosso.png', scale: 0.94),

                )
            ),
          ]
      );
  }

}