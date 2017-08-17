PVector p;
PVector tr;
float a;
final float length=200;
final float arrowWidth=50;
final float arrowHeight=50;

void setup() {
  size(displayWidth,displayHeight);
  p = new PVector(0,length);
  tr = new PVector(width-length-10,height-length-10);
}
void draw() {
  background(#00FFFE);
  translate(tr.x,tr.y);
  float a=atan2(mouseY-tr.y,mouseX-tr.x)-PI/2;
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
  
}
