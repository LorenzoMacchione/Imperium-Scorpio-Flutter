
import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/Match/UI/Planet.dart';
import 'package:imperium_scorpio_flutter/database/Cards.dart';

import 'PlanetModel.dart';
import 'ResourceModel.dart';

class Enemy {

  late void Function() _refresh;
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
  }

  void draw(int i){
    res[i].useRes(1);
    enemyHand++;
    _refresh.call();
  }

  void playCard(Cards c, int planet){
    eRes1.useRes(c.res1);
    eRes2.useRes(c.res2);
    eRes3.useRes(c.res3);
    eRes4.useRes(c.res4);
    planets[planet].moveTo(SmallCardModel().newCard(c));
    _refresh.call();
  }

  void mining(int i){
    eRes1.minRes(i);
    eRes2.minRes(i);
    eRes3.minRes(i);
    eRes4.minRes(i);
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