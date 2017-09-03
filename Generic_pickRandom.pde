<T> T pickRandom(T[] a) {
  int r=int(random(0,a.length-0.01));
  return a[r];
}
PVector[] arr={new PVector(1,2),new PVector(3,4)};
void setup() {
  size(displayWidth,displayHeight);
}
void draw() {
  for (int i=0; i<12; i++) {
    println(pickRandom(arr).x+" "+pickRandom(arr).y);
  }
  
  exit();
}
