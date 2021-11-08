///Oggetto che gestisce le azioni e dei dati dell'avversario

import 'package:imperium_scorpio_flutter/Match/Model/Deck.dart';
import 'package:imperium_scorpio_flutter/Match/Model/Cards.dart';

import 'PlanetModel.dart';
import 'ResourceModel.dart';

class Enemy {

  Deck deck = Deck(); ///Collezione necessaria alla trascrizione degli id inviati tramite messaggio
  late void Function() _refresh; ///Funzione per richiamare setState() in seguito all'arrivo dei messagi
  int enemyHand = 3;
  late List<PlanetModel> planets;
  late List<ResourceModel> res;
  late ResourceModel eRes1;
  late ResourceModel eRes2;
  late ResourceModel eRes3;
  late ResourceModel eRes4;

  Enemy(void function(), List<PlanetModel> planets, ResourceModel eRes1, ResourceModel eRes2, ResourceModel eRes3,
      ResourceModel eRes4){
    _refresh = function;
    this.planets = planets;
    this.eRes1 = eRes1;
    this.eRes2 = eRes2;
    this.eRes3 = eRes3;
    this.eRes4 = eRes4;
    res = [eRes1,eRes2,eRes3,eRes4];
  }

/// funzione che gestisce il pescare passando quale risorsa si è consumata
  void draw(int i){
    res[i].useRes(1);
    enemyHand++;
    _refresh.call();
  }

  void playCard(int planet, int id){
    Cards c = deck.deck[id-1];
    c.player=1;
    eRes1.useRes(c.res1);
    eRes2.useRes(c.res2);
    eRes3.useRes(c.res3);
    eRes4.useRes(c.res4);
    planets[planet].CardmoveTo(c);
    _refresh.call();
  }

  void mining(int i){
    var r = planets[i].takeRes();
    eRes1.minRes(r[0]);
    eRes2.minRes(r[1]);
    eRes3.minRes(r[2]);
    eRes4.minRes(r[3]);
    _refresh.call();
  }

  void attack(int a, int d){
    Cards c = planets[d].read();
    planets[d].takeDamage(planets[a].attack);
    planets[a].takeDamage(c.attack);
    _refresh.call();
  }

  void move (int from, int to){
    planets[to].moveTo(planets[from].moveFrom());
    _refresh.call();
  }

}