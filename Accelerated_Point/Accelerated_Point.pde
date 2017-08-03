PVector p;
PVector vel;
PVector acc;

float decay=0.99;
void setup() {
  size(400, 400);
  p = new PVector(width/2, height/2);
  acc = new PVector(0, 0);
  vel = new PVector(0, 0);
  
  
  strokeWeight(20);
}

void mousePressed() {
  acc.x=mouseX-p.x;
  acc.y=mouseY-p.y;
  acc.normalize();
  acc.mult(2);
}
void draw() {
  //background(51);
  if (p.x>width || p.x<0) {
    vel.x*=-1;
    acc.x*=-1;
  }
  if (p.y>width || p.y<0) {
    vel.y*=-1;
    acc.y*=-1;
  }
  vel.add(acc);
  vel.limit(20);
  vel.mult(0.99);
  p.add(vel);
  stroke(255,255,255,150);
  point(p.x-vel.x,p.y-vel.y);
  stroke(255);
  point(p.x,p.y);
  acc.mult(decay);
}