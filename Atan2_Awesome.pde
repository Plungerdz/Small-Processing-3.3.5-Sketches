PVector p;
PVector tr;
PVector virtPos;
PVector velocity;
float a;
final float length=200;
final float arrowWidth=50;
final float arrowHeight=50;
final float offset=40;
float boatWidth=80;
float boatHeight=170;

void drawPolygon() {
  
}

void setup() {
  size(displayWidth,displayHeight);
  p = new PVector(0,length);
  tr = new PVector(width-length-10,height-length-10);
  virtPos = new PVector(0,0);
  velocity = new PVector(0,1);
}
void draw() {
  
  float a=atan2(mouseY-tr.y,mouseX-tr.x)-PI/2;
  velocity.rotate(a);
  virtPos.add(velocity);
  println("x:"+virtPos.x);
  println("y:"+virtPos.y);
  background(#00FFFE);
  translate(tr.x,tr.y);
  fill(200);
  strokeWeight(10);
  stroke(0);
  ellipse(0,0,length*2,length*2);
  rotate(a);
  strokeWeight(20);
  stroke(255,0,0);
  point(length,0);
  stroke(0,255,0);
  point(-length,0);
  stroke(0,0,255);
  point(0,-length);
  strokeWeight(1);
  stroke(0);
  fill(0);
  line(0,0,p.x,p.y);
  triangle(p.x,p.y,p.x-arrowWidth/2,p.y-arrowHeight,p.x+arrowWidth/2,p.y-arrowHeight);
  rotate(-a);
  translate(-tr.x,-tr.y);
  translate(width/2,height/2);
  fill(#7F4C00);
  rotate(a);
  rect(-boatWidth/2,-boatHeight/2,boatWidth,boatHeight);
  
}
