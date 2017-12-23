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

Dual mult(Dual a, Dual b) {
  return new Dual(a.real*b.real, a.real*b.epsilon+a.epsilon*b.real);
}

Dual div(Dual a, Dual b) {
  return mult(a, new Dual(1/b.real, 1/b.epsilon));
}

Dual tf(float x) {
  return mult(new Dual(x, 1), new Dual(x, 1));
}

int fact(int x) {
  if (x==0) return 1;
  else return x*fact(x-1);
}

/*
Dual fact(int x) {
 if (x==0) return new Dual(1,0);
 else return mult(new Dual(x,1),fact(x-1));
 }
 */
/*
Dual dsin(float x) {
 if (x<-PI) return dsin(x+2*PI);
 else if (x>PI) return dsin(x-2*PI);
 else {
 float s=0;
 for (int i=0; i<=10; i++) {
 s+=pow(-1,n)/fact(2*n+1)*pow(x,2*n+1);
 }
 return s;
 }
 }  
 */
float EPS = 1; 

/*
Dual fsqrt(float val) {
 Dual nval, low, high, mid, oldmid, midsqr; 
 
 nval = new Dual(abs(val),1); 
 low = new Dual(1,1); 
 high = nval;
 mid = nval; 
 oldmid = new Dual(-1,1); 
 while (abs(oldmid.real - mid.real) >= EPS2) { 
 oldmid = mid; 
 mid = mult(add(high,low),new Dual(1/2,1));
 midsqr = mult(mid,mid); 
 if (midsqr.real > nval.real) { 
 high = mid;
 } 
 else { 
 low = mid; 
 } } 
 return mid; }
 */
/*
float fsqrt(float x) {
 float a = 1; 
 float b = x; 
 while (abs(a-b)>EPS2){
 a = (a+b)/2; 
 b = x/a;
 } 
 return a;
 }
 */
/*
 Dual fsqrt(float x) {
 float EPS2 = 0.0000001;
 //if (x-floor(x)==0) EPS2=1;
 Dual a = new Dual(1,1); 
 Dual b = new Dual(x,1); 
 while (abs(a.real-b.real)>EPS2){
 a = div(add(a,b),new Dual(2,1)); 
 b = div(new Dual(x,1),a);
 } 
 return a;
 }
 */
/*
 float fsqrt(float value) { 
 float lo = 1.0; 
 float hi = value; 
 while( hi - lo > 0.00001) { 
 float mid = lo + (hi - lo) / 2 ; 
 if( mid * mid - value > 0.00001) 
 { hi = mid; 
 } else { 
 lo = mid; 
 } 
 } 
 return lo; 
 }
 */
/*
   Dual fsqrt(float value) { 
 Dual lo = new Dual(1.0,1.0); 
 Dual hi = new Dual(value,1); 
 while( hi.real - lo.real > 0.00001) { 
 Dual mid = add(lo, div(add(hi,new Dual(-lo.real,-lo.epsilon)), new Dual(2,1)) ); 
 if( mid.real * mid.real - value > 0.00001) 
 { hi = mid; 
 } else { 
 lo = mid; 
 } 
 } 
 return lo; 
 }    
 */
//the hack
Dual fsqrt(float x) {
  return new Dual(sqrt(x), 1/(2*sqrt(x)));
}
Dual fsqrt(Dual x) {
  return new Dual(sqrt(x.real), 1/(2*sqrt(x)));
}
/*
float fsqrt(float val) {
 float low, high, mid, oldmid, midsqr; 
 int step = 0; 
 
 val = abs (val); 
 low = 0; 
 high = val;
 mid = val; 
 oldmid = -1; 
 while (abs(oldmid - mid) >= EPS2) { 
 oldmid = mid; 
 mid = (high + low) / 2;
 midsqr = mid * mid; 
 if (mid * mid > val) { 
 high = mid;
 } 
 else { 
 low = mid; 
 } } 
 return mid; }
 */
/*
float fpow(float base, float exp){ 
 if(exp >= 1){ 
 float temp = fpow(base, exp / 2); 
 return temp * temp; } 
 else{ 
 float low = 0; 
 float high = 1.0; 
 float sqr = fsqrt(base); 
 float acc = sqr; 
 float mid = high / 2; 
 while(abs(mid - exp) > EPS){ 
 sqr = sqrt(sqr); 
 if (mid <= exp) { 
 low = mid; 
 acc *= sqr; } 
 else{ high = mid; 
 acc *= (1/sqr); } 
 mid = (low + high) / 2; } 
 return acc; 
 } 
 } 
 */

Dual fpow(Dual base, Dual exp) { 
  if (exp.real >= 1) { 
    Dual temp = fpow(base, div(exp,new Dual(2,0))); 
    return mult(temp,temp);
  } else { 
    Dual low = new Dual(0,0); 
    Dual high = new Dual(1.0,0); 
    Dual sqr = fsqrt(base); 
    Dual acc = sqr; 
    Dual mid = div(high,new Dual(2,1)); 
    while (abs(mid.real - exp.real) > EPS) { 
      sqr = sqrt(sqr); 
      if (mid.real <= exp.real) { 
        low = mid; 
        acc = mult(acc,sqr);
      } else { 
        high = mid; 
        acc = div(acc,sqr);
      } 
      mid = div(add(low,high), new Dual(2,1));
    } 
    return acc;
  }
} 

float dtf(float x) {
  return tf(x).epsilon;
}
void setup() {
  size(displayWidth, displayHeight);
  //translate(width/2,height/2);
  strokeWeight(5);
  translate(width/2, height/2);
  Dual a = fpow(new Dual(2,0),new Dual(2,0));
  println(a.real);
  println(a.epsilon);
  //println(fact(2).real);
  // println(fact(2).epsilon);
  exit();
}

void draw() {
  for (float x=-width/2; x<=width/2; x+=0.01) {
    point(x*20+width/2, height/2-tf(x).real*50);
    point(x*20+width/2, height/2-dtf(x)*50);
  }
}
