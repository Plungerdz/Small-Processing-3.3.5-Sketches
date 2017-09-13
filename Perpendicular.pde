PVector perpto(PVector a, PVector b, float length) {
  PVector res = new PVector((a.x+b.x)/2+length,(b.y+a.y)/2-(b.x-a.x)/(b.y-a.y)*length);
  return res;
}
PVector p;
PVector r;

void setup() {
  size(displayWidth, displayHeight);
  p = new PVector(0,0);
  r = new PVector(0,0);
}

void draw() {
  translate(width/2,height/2);
  r.set(mouseX/2,mouseY/2);
  background(200);
  PVector n=perpto(p,r,200);
  line(p.x,p.y,r.x,r.y);
  line((p.x+r.x)/2,(p.y+r.y)/2,n.x,n.y);
}
