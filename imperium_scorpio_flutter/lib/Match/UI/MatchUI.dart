import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imperium_scorpio_flutter/Match/Model/PlanetModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/ResourceModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/Match/UI/SmallCard.dart';

class MatchUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MatchState();
}

class _MatchState extends State {
  var activeCard = -1;
  var enemyHand = 3;
  var Planets = List<PlanetModel>.empty();

  _MatchState() {
    Planets = [p1, p2, p3, p4, p5, p6, p7, p8];
  }

  void refreshUI() {
    setState(() {});
  }

  ResourceModel eRes1 = ResourceModel();
  ResourceModel eRes2 = ResourceModel();
  ResourceModel eRes3 = ResourceModel();
  ResourceModel eRes4 = ResourceModel();

  PlanetModel p9 = PlanetModel(8, 1, true, false, true, false);
  PlanetModel p8 = PlanetModel(7, 1, false, true, false, true);
  PlanetModel p7 = PlanetModel(6, 1, true, true, false, false);
  PlanetModel p6 = PlanetModel(5, 1, false, false, true, true);
  PlanetModel p5 = PlanetModel(4, 3, true, true, true, true);
  PlanetModel p4 = PlanetModel(3, 1, false, false, true, true);
  PlanetModel p3 = PlanetModel(2, 1, true, true, false, false);
  PlanetModel p2 = PlanetModel(1, 1, false, true, false, true);
  PlanetModel p1 = PlanetModel(0, 1, true, false, true, false);

  SmallCardModel hc1 = SmallCardModel();
  SmallCardModel hc2 = SmallCardModel();
  SmallCardModel hc3 = SmallCardModel();
  SmallCardModel hc4 = SmallCardModel();
  SmallCardModel hc5 = SmallCardModel();

  ResourceModel Res1 = ResourceModel();
  ResourceModel Res2 = ResourceModel();
  ResourceModel Res3 = ResourceModel();
  ResourceModel Res4 = ResourceModel();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Stack(
      children: [
        Image.asset(
          'assets/images/match_background.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Visibility(
                          child: Container(
                            child: Image.asset('assets/images/retro_carta.png'),
                            width: 45,
                            height: 45,
                          ),
                          visible: enemyHand >= 1,
                        ),
                        Visibility(
                          child: Container(
                            child: Image.asset('assets/images/retro_carta.png'),
                            width: 45,
                            height: 45,
                          ),
                          visible: enemyHand >= 2,
                        ),
                        Visibility(
                          child: Container(
                            child: Image.asset('assets/images/retro_carta.png'),
                            width: 45,
                            height: 45,
                          ),
                          visible: enemyHand >= 3,
                        ),
                        Visibility(
                          child: Container(
                            child: Image.asset('assets/images/retro_carta.png'),
                            width: 45,
                            height: 45,
                          ),
                          visible: enemyHand >= 4,
                        ),
                        Visibility(
                          child: Container(
                            child: Image.asset('assets/images/retro_carta.png'),
                            width: 45,
                            height: 45,
                          ),
                          visible: enemyHand >= 5,
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 40,
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            child: Text(
                              '${eRes1.read()}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.lightBlue,
                            alignment: Alignment.center,
                            child: Text(
                              '${eRes1.read()}',
                              style: TextStyle(fontSize: 25),
                            )),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              '${eRes1.read()}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              '${eRes1.read()}',
                              style: TextStyle(fontSize: 25),
                            )),
                      ],
                    ),
                  ]))
                ],
              ),
              Container(
                height: 25,
              ),
              Stack(alignment: Alignment.center, children: [
                Image.asset(
                  'assets/images/ice.png',
                  scale: 0.5,
                  width: 85,
                  height: 85,
                ),
                Visibility(
                  child: MaterialButton(
                    child: SmallCard(
                      card: p9,
                      width: 56,
                      height: 70,
                    ),
                    onPressed: (){
                      activeCard = 8;
                      refreshUI();
                    },
                  ),
                  visible: p9.hp != -1,
                ),
                Visibility(
                  visible: p9.range1.contains(activeCard)&&!p9.controlled,
                  child: MaterialButton(
                    child: Image.asset('assets/images/anello_verde.png',
                        scale: 0.94),
                    onPressed: (){
                      p9.moveTo(Planets[activeCard].moveFrom());
                      activeCard=-1;
                      refreshUI();
                    },
                  )
                ),
                Visibility(
                    visible: activeCard==8,
                    child: MaterialButton(
                      child: Image.asset('assets/images/anello_giallo.png',
                          scale: 0.94),
                      onPressed: () {
                        var r = p9.takeRes();
                        Res1.minRes(r[0]);
                        Res2.minRes(r[1]);
                        Res3.minRes(r[2]);
                        Res4.minRes(r[3]);
                        activeCard=-1;
                        refreshUI();
                      },
                    )),
                Visibility(
                    visible: p9.range1.contains(activeCard)&&p9.controlled,
                    child: MaterialButton(
                      onPressed: () {
                        p9.takeDamage(Planets[activeCard].attack);
                        activeCard=-1;
                        refreshUI();
                      },
                      child: Image.asset('assets/images/anello_rosso.png',
                          scale: 0.94),
                    )),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p7,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 6;
                          refreshUI();
                        },
                      ),
                      visible: p7.hp != -1,
                    ),
                    Visibility(
                      visible: p7.range1.contains(activeCard)&&!p7.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p7.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: activeCard==6,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: () {
                            var r = p7.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )),
                    Visibility(
                        visible: p7.range1.contains(activeCard)&&p7.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p7.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p8,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 7;
                          refreshUI();
                        },
                      ),
                      visible: p8.hp != -1,
                    ),
                    Visibility(
                      visible: p8.range1.contains(activeCard)&&!p8.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p8.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==7,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p8.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p8.range1.contains(activeCard)&&p8.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p8.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p4,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 3;
                          refreshUI();
                        },
                      ),
                      visible: p4.hp != -1,
                    ),
                    Visibility(
                      visible: p4.range1.contains(activeCard)&&!p4.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p4.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==3,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p4.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p4.range1.contains(activeCard)&&p4.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p4.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p5,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 4;
                          refreshUI();
                        },
                      ),
                      visible: p5.hp != -1,
                    ),
                    Visibility(
                      visible: p5.range1.contains(activeCard)&&!p5.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p5.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==4,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p5.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p5.range1.contains(activeCard)&&p5.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p5.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p6,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 5;
                          refreshUI();
                        },
                      ),
                      visible: p6.hp != -1,
                    ),
                    Visibility(
                      visible: p6.range1.contains(activeCard)&&!p6.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p6.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==5,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p6.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p6.range1.contains(activeCard)&&p6.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p6.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p2,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 1;
                          refreshUI();
                        },
                      ),
                      visible: p2.hp != -1,
                    ),
                    Visibility(
                      visible: p2.range1.contains(activeCard)&&!p2.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p2.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==1,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p2.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p2.range1.contains(activeCard)&&p2.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p2.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/ice.png',
                      scale: 0.5,
                      width: 85,
                      height: 85,
                    ),
                    Visibility(
                      child: MaterialButton(
                        child: SmallCard(
                          card: p3,
                          width: 56,
                          height: 70,
                        ),
                        onPressed: (){
                          activeCard = 2;
                          refreshUI();
                        },
                      ),
                      visible: p3.hp != -1,
                    ),
                    Visibility(
                      visible: p3.range1.contains(activeCard)&&!p3.controlled,
                        child: MaterialButton(
                          child: Image.asset('assets/images/anello_verde.png',
                              scale: 0.94),
                          onPressed: (){
                            p3.moveTo(Planets[activeCard].moveFrom());
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                      visible: activeCard==2,
                        child: MaterialButton(
                          child:  Image.asset('assets/images/anello_giallo.png',
                              scale: 0.94),
                          onPressed: (){
                            var r =p3.takeRes();
                            Res1.minRes(r[0]);
                            Res2.minRes(r[1]);
                            Res3.minRes(r[2]);
                            Res4.minRes(r[3]);
                            activeCard=-1;
                            refreshUI();
                          },
                        )
                    ),
                    Visibility(
                        visible: p3.range1.contains(activeCard)&&p3.controlled,
                        child: MaterialButton(
                          onPressed: () {
                            p3.takeDamage(Planets[activeCard].attack);
                            activeCard=-1;
                            refreshUI();
                          },
                          child: Image.asset('assets/images/anello_rosso.png',
                              scale: 0.94),
                        )),
                  ]),
                ],
              ),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    'assets/images/ice.png',
                    scale: 0.5,
                    width: 85,
                    height: 85,
                  ),
                  Visibility(
                    child: MaterialButton(
                      child: SmallCard(
                        card: p1,
                        width: 56,
                        height: 70,
                      ),
                      onPressed: (){
                        activeCard = 0;
                        refreshUI();
                      },
                    ),
                    visible: p1.hp != -1,
                  ),
                  Visibility(
                    visible: p1.range1.contains(activeCard)&&!p1.controlled,
                      child: MaterialButton(
                        child: Image.asset('assets/images/anello_verde.png',
                            scale: 0.94),
                        onPressed: (){
                          p1.moveTo(Planets[activeCard].moveFrom());
                          activeCard=-1;
                          refreshUI();
                        },
                      )
                  ),
                  Visibility(
                    visible: activeCard==0,
                      child: MaterialButton(
                        child:  Image.asset('assets/images/anello_giallo.png',
                            scale: 0.94),
                        onPressed: (){
                          var r =p1.takeRes();
                          Res1.minRes(r[0]);
                          Res2.minRes(r[1]);
                          Res3.minRes(r[2]);
                          Res4.minRes(r[3]);
                          activeCard=-1;
                          refreshUI();
                        },
                      )
                  ),
                  Visibility(
                      visible: p1.range1.contains(activeCard)&&p1.controlled,
                      child: MaterialButton(
                        onPressed: () {
                          p1.takeDamage(Planets[activeCard].attack);
                          activeCard=-1;
                          refreshUI();
                        },
                        child: Image.asset('assets/images/anello_rosso.png',
                            scale: 0.94),
                      )),
                ]),
              Stack(
                children: [
                  Container(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Visibility(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.deepPurple,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.purple
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 3))
                                          ]),
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 25,
                                      child: Text(
                                        'DRAW',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )),
                                visible: false,
                              ),
                              Container(
                                width: 40,
                                color: Colors.deepPurple,
                                alignment: Alignment.center,
                                child: Text('${Res1.read()}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Visibility(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.lightBlue,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blue
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 3))
                                          ]),
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 25,
                                      child: Text(
                                        'DRAW',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )),
                                visible: false,
                              ),
                              Container(
                                  width: 40,
                                  color: Colors.lightBlue,
                                  alignment: Alignment.center,
                                  child: Text('${Res1.read()}',
                                      style: TextStyle(fontSize: 25))),
                            ],
                          ),
                          Column(
                            children: [
                              Visibility(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.black,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blueGrey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 3))
                                          ]),
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 25,
                                      child: Text(
                                        'DRAW',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )),
                                visible: false,
                              ),
                              Container(
                                width: 40,
                                color: Colors.black,
                                alignment: Alignment.center,
                                child: Text('${Res1.read()}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Visibility(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 3))
                                          ]),
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 25,
                                      child: Text(
                                        'DRAW',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )),
                                visible: false,
                              ),
                              Container(
                                width: 40,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text('${Res1.read()}',
                                    style: TextStyle(fontSize: 25)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Visibility(
                            child: SmallCard(card: hc1),
                            visible: hc1.hp != -1,
                          ),
                          Visibility(
                            child: SmallCard(card: hc2),
                            visible: hc2.hp != -1,
                          ),
                          Visibility(
                            child: SmallCard(card: hc3),
                            visible: hc3.hp != -1,
                          ),
                          Visibility(
                              child: SmallCard(card: hc4),
                              visible: hc4.hp != -1),
                          Visibility(
                              child: SmallCard(card: hc5),
                              visible: hc5.hp != -1),
                        ],
                      ),
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
        Visibility(
          visible: false,
          child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.7),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WIN\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'sf',
                          color: Colors.orangeAccent,
                          fontSize: 75,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Tocca per continuare',
                    style: TextStyle(
                      fontFamily: 'sf',
                      color: Colors.orangeAccent,
                      fontSize: 30,
                    ),
                  ),
                ],
              )),
        ),
        Visibility(
          visible: false,
          child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.7),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOSE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'laceration',
                          color: Colors.red,
                          fontSize: 70,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Tocca per continuare',
                    style: TextStyle(
                      fontFamily: 'laceration',
                      color: Colors.red,
                      fontSize: 21,
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
