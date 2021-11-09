import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/backgroundRules_3.png',
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            children: [
              Container(height: 30),
              Text(
                "Rules",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'orion', color: Colors.amber, fontSize: 70),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "\n Obbiettivo \n \n Lo scopo del giocatore e' quello di riuscire a piazzare una sua carta nel "
                    "pianeta principale nemico."
                    "\n Come si gioca \n \n Ad ogni player verra' assegnato un mazzo predefinito."
                    "\nAd ogni turno il giocatore puo' scegliere se evocare una sua carta spendendo risorse, "
                    "muovere una delle carte giocate,attaccare una carta avversaria se questa è vicino ad una delle nostre "
                    "oppure sacrificare 1 punto vita di una carta per ottenererisorse sul pianeta in cui essa e' situata."
                    "\n Comandi \n \n Premendo su una carta situata nella nostra mano ringrandirai essa per vedere maggiori dettagli."
                    "\n Tenendo premuto su una carta situata nella nostra mano potremo spostarla su uno dei 3 pianeti vicini a noi."
                    "\n Premendo su una carta collocata su un pianeta compariranno degli anelli:"
                    "\n-Anello verde possiamo spostare la nostra carta nel pianeta vicino"
                    "\n-Anello Rosso possiamo attaccare una carta nemica collocata sul pianeta vicino"
                    "\n-Anello Giallo comparira' sul pianeta in cui la carta sara' situata e premendo sopra ad essa prenderai le risorse "
                    "di quel pianeta",
                    style: TextStyle(
                        fontFamily: 'laceration',
                        color: Colors.amber,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.home, color: Colors.white),
          ),
        )
      ],
    );
  }
}
