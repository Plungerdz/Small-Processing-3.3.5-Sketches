ArrayList<PVector> points = new ArrayList<PVector>();
final float spacing=60;

void setup() {
  noStroke();
  size(1534,1545);
  for (float x=0; x<=width; x+=spacing) {
    points.add(new PVector(x,0));
  }
  for (float y=0; y<=width; y+=spacing) {
    points.add(new PVector(width,y));
  }
  for (float x=0; x<=width; x+=spacing) {
    points.add(new PVector(x,height));
  }
  for (float y=0; y<=height; y+=spacing) {
    points.add(new PVector(0,y));
  }
}

void draw() {
  for (int i=0; i<points.size()-1; i++) {
    PVector a=points.get(i);
    PVector b=points.get(i+1);
    if (i%2==0) fill(#0F99FF);
    else fill(#FFF700);
    triangle(a.x,a.y,b.x,b.y,width/2,height/2);
  }
  saveFrame("bg.png");
  noLoop();
}