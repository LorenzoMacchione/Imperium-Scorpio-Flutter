///Widget che rappresenta le carte

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import '../Model/Cards.dart';

class SmallCard extends StatefulWidget {
  SmallCardModel card;
  double? width;
  double? height;
  SmallCard({
     required this.card, this.width, this.height});

  @override
  State<StatefulWidget> createState() => _CardState(card,width,height);
}





  class _CardState extends State<SmallCard> {
  late SmallCardModel card;
   double width = 60;
   double height = 80;
  _CardState(SmallCardModel card, double? width, double? height){
    this.card = card;
    if(width!=null)this.width = width;
    if (height!=null)this.height = height;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child:
        Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/small_card_background.png'),
          RotatedBox(
            quarterTurns: card.player+(card.player%2),
            child: Image.asset('assets/images/card_${card.card.id}.png'),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                    '${card.res1}',
                      style: TextStyle(
                          backgroundColor:Colors.deepPurple,
                          color: Colors.white
                      ),
                    ),

                    Text(
                      '${card.res2}',
                      style: TextStyle(
                          backgroundColor: Colors.lightBlue
                      ),
                    ),

                    Text(
                      '${card.res3}',
                      style: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white
                      ),
                    ),

                    Text(
                      '${card.res4}',
                      style: TextStyle(
                          backgroundColor: Colors.white
                      ),
                    ),
                  ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${card.attack}',
                        style: TextStyle(
                          backgroundColor: Colors.red,
                        ),
                      ),

                      Text(
                        '${card.mining}',
                        style: TextStyle(
                          backgroundColor: Colors.amber,
                        ),
                      ),

                      Text(
                        '${card.hp}',
                        style: TextStyle(
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }



  }


