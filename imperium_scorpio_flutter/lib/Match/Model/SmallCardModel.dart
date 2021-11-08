///SmallCardModel è un oggetto che permette di lavorare su una copia dei dati della carta e mantenere le informazioni
/// della carta originaria ad esempio se ci fosse un effeto di cura gli hp della carta non potrebbero eccedere il valore originario


import 'package:flutter/cupertino.dart';
import 'package:imperium_scorpio_flutter/Match/Model/Cards.dart';

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
  }

  SmallCardModel copy(){
    var s = SmallCardModel();
    s.newCard(this.card);
    s.attack = this.attack;
    s.hp= this.hp;
    s.mining = this.mining;
    s.res1 = this.res1;
    s.res2 = this.res2;
    s.res3 = this.res3;
    s.res4 = this.res4;
    s.player = this.player;
    return s;
  }

  blank(){
    newCard( Cards());
  }


}