float a=PI/10;
float lx;
float ly;
float rx;
float ry;
PVector pos;
PVector spir;

void setup() {
  size(displayWidth,displayHeight);
  pos = new PVector(0,60);
  spir = new PVector(1,1);
  background(0);
  strokeWeight(8);
  rx=random(-10,10);
  ry=random(-10,10);
  if (rx==0) rx=1;
  if (ry==0) ry=1;
  spir.x*=rx;
  spir.y*=ry;
}

void draw() {
  translate(width/2,height/2);
  stroke(255);
  lx=pos.x;
  ly=pos.y;
  pos.rotate(a);
  spir.rotate(a);
  pos.add(spir);
  line(lx,ly,pos.x,pos.y);
}
