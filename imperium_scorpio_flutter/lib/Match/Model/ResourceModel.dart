

class ResourceModel{

  int res=5;

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