
Dual f(float x) {
  return dsqrt(sub(new Dual(2,0),mult(new Dual(2,0),dsin(x))));
}

final float precision=0.000001;

float zero(float n, int i) {
  Dual a;
  a=f(n);
  n-=a.real/a.epsilon;
  if (i==1) return n;
  else return zero(n,i-1);
}
float zero(float n) {
  Dual a;
  /*
  do {
  a=f(n);
  n-=a.real/a.epsilon;
  } while (abs(f(a.real).real)>precision);
  */
  a=f(n);
  n-=a.real/a.epsilon;
  return zero(n,9);
}

void setup() {
  size(displayWidth,displayHeight);
  float aux=zero(3*PI);
  println(aux);
  println(f(aux).real);
  exit();
}

void draw() {
  //println(f(1.5707964).real);
}
