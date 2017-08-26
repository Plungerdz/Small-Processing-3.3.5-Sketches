void drawPolygon(float x, float y, float radius, float vertexCount) {
  PVector gen = new PVector(0,radius);
  float angle=2*PI/vertexCount;
  beginShape();
  vertex(gen.x+x,gen.y+y);
  for (int i=1; i<=vertexCount; i++) {
    gen.rotate(angle);
    vertex(gen.x+x,gen.y+y);
  }
  endShape();
}
final float r=100;
final float d=sqrt(3)/2.0*r;
ArrayList<PVector> grid;
PVector pos;
void keyPressed() {
  if (key!=CODED) {
    switch (key) {
      case 'a': pos.x-=2*d;
                break;
      case 'd': pos.x+=2*d;
                break;
      case 'q': pos.x-=d;
                pos.y-=1.5*r;
                break;
      case 'e': pos.x+=d;
                pos.y-=1.5*r;
                break;
      case 'z': pos.x-=d;
                pos.y+=1.5*r;
                break;
      case 'c': pos.x+=d;
                pos.y+=1.5*r;
                break;
    }  
  }
  
}
void setup() {
  size(900, 900);
  grid = new ArrayList<PVector>();
  pos = new PVector(0,0);
}
void draw() {
  strokeWeight(1);
  boolean alternate=true;
  float winc=0;
  for (float y=0; y<=height+r; y+=1.5*r) {
    if (alternate) {
      float hinc=0;
      for (float x=0; x<=width+2*d; x+=2*d) {
        drawPolygon(x,y,r,6);
        grid.add(new PVector(x,y));
      }
      alternate=false;
    } else {
       float hinc=0;
       for (float x=-d; x<=width+2*d; x+=2*d) {
        drawPolygon(x,y,r,6);
        grid.add(new PVector(x,y));
      }
      alternate=true;
    }
    
  }
  strokeWeight(10);
  point(pos.x,pos.y);
  
}