


import 'package:flutter/cupertino.dart';
import 'package:imperium_scorpio_flutter/database/Cards.dart';

class SmallCardModel{

  Cards card = Cards();
  int player = 0;


  String name="-1";
  int res1=-1;
  int res2=-1;
  int res3=-1;
  int res4=-1;
  String text="-1";
  int attack=-1;
  int mining=-1;
  int hp=-1;

  bool visible = false;


  Cards read(){
    return card;
  }

  takeDamage(int i){
    hp -= i;
    if (hp <= 0) blank();
  }

  newCard(Cards c){
    this.card=c;
    attack = c.attack;
    hp = c.hp;
    mining = c.mining;
    res1 = c.res1;
    res2 = c.res2;
    res3 = c.res3;
    res4 = c.res4;
    visible = true;
  }

  /*copy():SmallCard{
  val s = SmallCard(context)
  s.newCard(this.card)
  s._attack.value = this.attack.value
  s._hp.value = this.hp.value
  s._mining.value = this.mining.value
  s._r1.value = this.r1.value
  s._r2.value = this.r2.value
  s._r3.value = this.r3.value
  s._r4.value = this.r4.value
  return s
  }*/

  blank(){
    newCard( Cards());
    visible=false;
  }


}