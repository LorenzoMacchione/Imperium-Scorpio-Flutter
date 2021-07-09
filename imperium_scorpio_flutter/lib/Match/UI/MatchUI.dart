import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imperium_scorpio_flutter/Match/Model/PlanetModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/ResourceModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/SmallCardModel.dart';
import 'package:imperium_scorpio_flutter/Match/UI/SmallCard.dart';


class MatchUI extends StatelessWidget{

  var activeCard = -1;

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
                    child: Column(
                      children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 45,
                          height: 45,
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 45,
                          height: 45,
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 45,
                          height: 45,
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 45,
                          height: 45,
                        ),
                        Container(
                          width: 10,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 45,
                          height: 45,
                        )
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
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                              ),
                            )
                        ),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.lightBlue,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            )
                        ),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                              ),
                            )
                        ),
                        Container(
                          width: 20,
                        ),
                        Container(
                            width: 40,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            )
                        ),
                      ],
                    ),
                    ]
                  )
                  )
                ],
              ),
              Container(
                height: 25,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                      'assets/images/islands.png',
                      width: 85,
                      height: 85,
                    ),
                  SmallCard(
                      card: p9,
                      width: 56,
                      height: 70,
                  ),
                  Image.asset('assets/images/anello_verde.png', scale: 0.94),
                  Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                  Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                          'assets/images/water.png',
                          width: 85,
                          height: 85,
                      ),
                      SmallCard(
                        card: p7,
                        width: 56,
                        height: 70,
                      ),
                      Image.asset('assets/images/anello_verde.png', scale: 0.94),
                      Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                      Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                    ]
                  ),
                  Container(width: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                          'assets/images/redp.png',
                          width: 85,
                          height: 85,
                      ),
                      SmallCard(
                        card: p8,
                        width: 56,
                        height: 70,
                      ),
                      Image.asset('assets/images/anello_verde.png', scale: 0.94),
                      Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                      Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                    ]
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/baren.png',
                            scale: 0.5,
                            width: 85,
                            height: 85,
                        ),
                        SmallCard(
                          card: p4,
                          width: 56,
                          height: 70,
                        ),
                        Image.asset('assets/images/anello_verde.png', scale: 0.94),
                        Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                        Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/star.png',
                          width: 110,
                          height: 110,
                        ),
                        SmallCard(
                          card: p5,
                          width: 56,
                          height: 70,
                        ),
                        Image.asset('assets/images/anello_verde.png', scale: 0.94),
                        Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                        Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/toxic.png',
                            width: 85,
                            height: 85,
                        ),
                        SmallCard(
                          card: p6,
                          width: 56,
                          height: 70,
                        ),
                        Image.asset('assets/images/anello_verde.png', scale: 0.94),
                        Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                        Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                      ]
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/lava.png',
                            scale: 0.5,
                            width: 85,
                            height: 85,
                        ),
                        SmallCard(
                          card: p2,
                          width: 56,
                          height: 70,
                        ),
                        Image.asset('assets/images/anello_verde.png', scale: 0.94),
                        Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                        Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/ice.png',
                            scale: 0.5,
                            width: 85,
                            height: 85,
                        ),
                        SmallCard(
                          card: p3,
                          width: 56,
                          height: 70,
                        ),
                        Image.asset('assets/images/anello_verde.png', scale: 0.94),
                        Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                        Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                      ]
                  ),
                ],
              ),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                        'assets/images/terran.png',
                        scale: 0.5,
                        width: 85,
                        height: 85,
                    ),
                    SmallCard(
                      card: p1,
                      width: 56,
                      height: 70,
                    ),
                    Image.asset('assets/images/anello_verde.png', scale: 0.94),
                    Image.asset('assets/images/anello_giallo.png', scale: 0.94),
                    Image.asset('assets/images/anello_rosso.png', scale: 0.94)
                  ]
              ),

              Stack(
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(onPressed: (){},
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.deepPurple,
                                        boxShadow: [BoxShadow(
                                            color: Colors.purple.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,3)
                                        )]
                                    ),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 25,
                                    child: Text (
                                      'DRAW',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                    ),
                                  )
                              ),
                              MaterialButton(onPressed: (){},
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.lightBlue,
                                        boxShadow: [BoxShadow(
                                            color: Colors.blue.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,3)
                                        )]
                                    ),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 25,
                                    child: Text (
                                      'DRAW',
                                      style: TextStyle(
                                          fontSize: 15
                                      ),
                                    ),
                                  )
                              ),
                              MaterialButton(onPressed: (){},
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.black,
                                        boxShadow: [BoxShadow(
                                            color: Colors.blueGrey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,3)
                                        )]
                                    ),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 25,
                                    child: Text (
                                      'DRAW',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                    ),
                                  )
                              ),
                              MaterialButton(onPressed: (){},
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(
                                            color: Colors.white.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,3)
                                        )]
                                    ),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 25,
                                    child: Text (
                                      'DRAW',
                                      style: TextStyle(
                                          fontSize: 15
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                              ),
                              Container(
                                width: 40,
                                color: Colors.deepPurple,
                                alignment: Alignment.center,
                                child: Text(
                                    '${Res1.read()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    )
                                ),
                              ),
                              Container(
                                width: 30,
                              ),
                              Container(
                                  width: 40,
                                  color: Colors.lightBlue,
                                  alignment: Alignment.center,
                                  child:Text(
                                      '${Res1.read()}',
                                      style: TextStyle(
                                          fontSize: 25
                                      )
                                  )
                              ),
                              Container(
                                width: 30,
                              ),
                              Container(
                                width: 40,
                                color: Colors.black,
                                alignment: Alignment.center,
                                child: Text(
                                    '${Res1.read()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    )
                                ),
                              ),
                              Container(
                                width: 30,
                              ),
                              Container(
                                width: 40,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                    '${Res1.read()}',
                                    style: TextStyle(
                                        fontSize: 25
                                    )
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmallCard(card: hc1),
                              Container(
                                width: 10,
                              ),
                              SmallCard(card: hc2),
                              Container(
                                width: 10,
                              ),
                              SmallCard(card: hc3),
                              Container(
                                width: 10,
                              ),
                              SmallCard(card: hc4),
                              Container(
                                width: 10,
                              ),
                              SmallCard(card: hc5),
                            ],
                          ),
                        ]
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      Visibility(child:
        Scaffold(
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
          )
        ),
      ),
        Visibility(child:
        Scaffold(
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
            )
          ),
        )
      ],
    );
  }
}
