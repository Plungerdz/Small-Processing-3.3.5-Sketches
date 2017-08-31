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

void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  drawPolygon(width/2,height/2,200,6);
}
