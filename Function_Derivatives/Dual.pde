class Dual {
  float real;
  float epsilon;
  
  Dual(float r) {
    real=r;
    epsilon=0;
  }
  Dual(float r, float e) {
    real=r;
    epsilon=e;
  }
  
}