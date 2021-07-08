

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Cards.dart';

class CardDB{

  late String path;
  late final database;

  load(){
    for (int a=0; a<22; a++){
      Cards newCard = Cards.setCards(a, "Giuseppe$a", a, a, a, a,"Bella", a, a, a);
      insertCard(newCard);
    }
  }

  setDB() async {
    path = join(await getDatabasesPath(), 'cards_database.db');
    database = openDatabase(
        path,version: 1,onCreate: (db,version){
      return db.execute(
          'CREATE TABLE cards(id INTEGER PRIMARY KEY, name TEXT, res1 INTEGER, res2 INTEGER, res3 INTEGER, res4 INTEGER, text TEXT, attack INTEGER, mining INTEGER, hp INTEGER)'
      );
    });
  }


  Future<void> insertCard(Cards card) async {
    final db = await database;
    await db.insert('cards', card.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
  }



   Future<Cards> getCardById(int i) async{
    final db = await database;
    final Cards card = await db.query('SELECT * FROM cards WHERE id==$i');
    return card;
  }




}