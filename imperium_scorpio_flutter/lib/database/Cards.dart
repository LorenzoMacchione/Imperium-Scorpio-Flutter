


class Cards{

  int id=-1;
  String name="-1";
  int res1=-1;
  int res2=-1;
  int res3=-1;
  int res4=-1;
  String text="-1";
  int attack=-1;
  int mining=-1;
  int hp=-1;


  Cards(){}

  Cards.setCards(int id, String name, int res1, int res2,int res3, int res4, String text, int attack, int mining, int hp){
    this.id = id;
    this.name = name;
    this.res1 = res1;
    this.res2 = res2;
    this.res3 = res3;
    this.res4 = res4;
    this.text = text;
    this.attack = attack;
    this.mining = mining;
    this.hp = hp;
  }

  Map<String, dynamic> toMap(){
    return { 'id':id, 'name': name, 'res1': res1, 'res2':res2,'res3':res3, 'res4':res4,'text':text,'attack':attack,'mining':mining,'hp':hp };
  }

}

