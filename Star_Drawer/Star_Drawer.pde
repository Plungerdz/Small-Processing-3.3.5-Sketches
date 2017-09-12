void drawStar(float x, float y, float radius, float vertexCount) {
    PVector gen = new PVector(0,radius);
    float angle=2*PI/vertexCount;
    pushMatrix();
    translate(x,y);
    beginShape();
    vertex(gen.x,gen.y);
    for (int i=1; i<=vertexCount*2; i++) {
      gen.rotate(angle/2);
      if (i%2==0) {
        gen.setMag(radius);
      } else {
        gen.setMag(radius/2);
      }
      vertex(gen.x,gen.y);
    }
    endShape();
    popMatrix();
 }
 
 void drawStar(float x, float y, float radius, float vertexCount, float innerRadius) {
    PVector gen = new PVector(0,radius);
    float angle=2*PI/vertexCount;
    pushMatrix();
    translate(x,y);
    beginShape();
    vertex(gen.x,gen.y);
    for (int i=1; i<=vertexCount*2; i++) {
      gen.rotate(angle/2);
      if (i%2==0) {
        gen.setMag(radius);
      } else {
        gen.setMag(innerRadius);
      }
      vertex(gen.x,gen.y);
    }
    endShape();
    popMatrix();
 }
void setup() {
  size(800, 800);
  
}

void draw() {
  drawStar(width/2, height/2, 200, 6, 80);
}