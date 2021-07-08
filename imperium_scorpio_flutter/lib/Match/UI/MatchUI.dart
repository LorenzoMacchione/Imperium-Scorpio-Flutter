import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium_scorpio_flutter/Match/Model/PlanetModel.dart';
import 'package:imperium_scorpio_flutter/Match/Model/ResourceModel.dart';
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



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            'assets/images/match_background.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/enemyBoard.png'),
                  Container(
                    child: Column(
                      children:[
                      Container(
                        height: 5,
                      ),
                      Row(
                      children: [
                        Container(
                          width: 20,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 54,
                          height: 56,
                        ),
                        Container(
                          width: 5,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 54,
                          height: 56,
                        ),
                        Container(
                          width: 5,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 54,
                          height: 56,
                        ),
                        Container(
                          width: 5,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 54,
                          height: 56,
                        ),
                        Container(
                          width: 5,
                        ),
                        Container(
                          child: Image.asset('assets/images/retro_carta.png'),
                          width: 54,
                          height: 56,
                        )
                      ],
                    ),
                      Container(
                        height: 10,
                      ),
                      Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                            width: 50,
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30
                              ),
                            )
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                            width: 50,
                            color: Colors.lightBlue,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  fontSize: 30
                              ),
                            )
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                            width: 50,
                            color: Colors.black,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30
                              ),
                            )
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                            width: 50,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child:Text(
                              '${eRes1.read()}',
                              style: TextStyle(
                                  fontSize: 30
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
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                      'assets/images/islands.png',
                      width: 80,
                      height: 80,
                    ),
                  SmallCard(
                      card: p9,
                      width: 56,
                      height: 70,
                  )
                ],
              ),
              Container(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                          'assets/images/water.png',
                          width: 80,
                          height: 80,
                      ),
                      SmallCard(card: p7)
                    ]
                  ),
                  Container(width: 15),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                          'assets/images/redp.png',
                          width: 80,
                          height: 80,
                      ),
                      SmallCard(card: p8)
                    ]
                  ),
                ],
              ),
              Container(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/baren.png',
                            scale: 0.5,
                            width: 80,
                            height: 80,
                        ),
                        SmallCard(card: p4)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/star.png',
                            scale: 0.5,
                            width: 80,
                            height: 80,
                        ),
                        SmallCard(card: p5)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/toxic.png',
                            width: 80,
                            height: 80,
                        ),
                        SmallCard(card: p6)
                      ]
                  )
                ],
              ),
              Container(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/lava.png',
                            scale: 0.5,
                            width: 80,
                            height: 80,
                        ),
                        SmallCard(card: p2)
                      ]
                  ),
                  Container(width: 15),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                            'assets/images/ice.png',
                            scale: 0.5,
                            width: 80,
                            height: 80,
                        ),
                        SmallCard(card: p3)
                      ]
                  ),
                ],
              ),
              Container(height: 3),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                        'assets/images/terran.png',
                        scale: 0.5,
                        width: 80,
                        height: 80,
                    ),
                    SmallCard(card: p1)
                  ]
              ),
            ],
          ),
        )
      ],
    );
  }
}
