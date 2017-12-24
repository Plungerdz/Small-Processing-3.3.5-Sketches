float rsin(float x) {
  return sqrt(2-2*sin(x))/10;
}

float rcos(float x) {
  return sqrt(2-2*cos(x));
}

float f(float x) {
  return x*x;
}
float df(float x) {
  return (f(x+0.01)-f(x))/0.01;
}

int pressNum=0;
void ppoint(float x, float y) {
  //println("x:"+x);
  //println("y:"+y);
  point(x, y);
}

Dual add(Dual a, Dual b) {
  return new Dual(a.real+b.real, a.epsilon+b.epsilon);
}

Dual sub(Dual a, Dual b) {
  return new Dual(a.real-b.real, a.epsilon-b.epsilon);
}

Dual mult(Dual a, Dual b) {
  return new Dual(a.real*b.real, a.real*b.epsilon+a.epsilon*b.real);
}

Dual div(Dual a, Dual b) {
  return mult(a, new Dual(1/b.real, 1/b.epsilon));
}



int fact(int x) {
  if (x==0) return 1;
  else return x*fact(x-1);
}


float EPS = 1; 


//the hack
Dual dsqrt(float x) {
  return new Dual(sqrt(x), 1/(2*sqrt(x)));
}
//froemrly fsqrt()
Dual dsqrt(Dual x) {
  return new Dual(sqrt(x.real), x.epsilon/(2*sqrt(x.real)));
}
//forerly fpow()
Dual dpow(float base, float exp) {
  return new Dual(pow(base,exp),exp*pow(base,exp-1));
}
//the other hack
Dual dsin(float x) {
  return new Dual(sin(x),cos(x));
}

Dual dasin(float x) {
  return new Dual(asin(x),1/(sqrt(1-sq(x))));
}

Dual dacos(float x) {
  return new Dual(acos(x),-1/(sqrt(1-sq(x))));
}

Dual datan(float x) {
  return new Dual(atan(x),1/(sq(x)+1));
}

Dual dacot(float x) {
  return sub(new Dual(PI/2,0),datan(x));
}

Dual tf(float x) {
  return dsqrt(add(new Dual(2,0),mult(new Dual(-2,0),dsin(-x))));
}
float dtf(float x) {
  return tf(x).epsilon;
}
void setup() {
  size(800, 800);
  //translate(width/2,height/2);
  strokeWeight(5);
  translate(width/2, height/2);
   //<>//
}

void draw() {
  for (float x=-width/2; x<=width/2; x+=0.01) {
    point(x*20+width/2, height/2-tf(x).real*50);
    point(x*20+width/2, height/2-dtf(x)*50);
  }
}