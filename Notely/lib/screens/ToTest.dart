

void main() {
  int x;
  int y;
  double dx;
  double dy;

  int retult1 = add(x, y);
  int result2 = subtract(x, y);
  double resutl3 = multiply(dx, dy);
  int result4 = forLoop(x, y);
  double result5 = whileLoop(dx, y);
  bool result6 = ifStatement(x, y);

}

int add(int x, int y){
  return x + y;
}

int subtract(int x, int y){
  return x - y;
}

double multiply(double x, double y){
  return x * y;
}

int forLoop(int x, int count){
  if(count <= 0){
    return null;
  }
  for(int i = 0; i <= count; i++){
    x += x;
  }
  return x;
}

double whileLoop(double y, int count){
  int i = 0;
  if(y == 0){
    return null;
  }
  if(count <= 0){
    return null;
  }
  while(i <= count){
    y = 1 / y;
    i++;
  }
  return y;
}

bool ifStatement(int x, int y){
  if(x > y){
    return true;
  }else{
    return false;
  }
}