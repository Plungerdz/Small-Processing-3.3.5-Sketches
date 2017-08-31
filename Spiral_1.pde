float a=PI/10;
float lx;
float ly;
float mx;
float my;
int seed;
PVector pos;
PVector spir;

void setup() {
  size(displayWidth,displayHeight);
  pos = new PVector(0,60);
  spir = new PVector(-7,-7);
  background(255);
  //strokeWeight(8);
  colorMode(HSB);
  strokeWeight(20);
  seed=int(random(255));
}

void draw() {
  translate(width/2,height/2);
  stroke(0);
  fill((millis()/30)%255,millis()%230,millis()%255);
  lx=pos.x;
  ly=pos.y;
  pos.rotate(a);
  mx=pos.x;
  my=pos.y;
  spir.rotate(a);
  pos.add(spir);
  //line(lx,ly,pos.x,pos.y);
  noStroke();
  triangle(lx,ly,pos.x,pos.y,mx+50,my+50);
}
