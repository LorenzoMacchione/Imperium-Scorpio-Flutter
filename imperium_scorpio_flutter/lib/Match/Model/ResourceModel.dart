///Classe gestisce una risorsa

class ResourceModel{

  int res=3;

  useRes (int i){
    res -= i;
  }

  minRes (int i){
    res += i;
  }

  int read (){
    return res;
  }
}