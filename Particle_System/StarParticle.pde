class StarParticle extends Particle {
  float radius=50;
  float vert=5;
  
  StarParticle(PVector l) {
    super(l);
  }
  /*
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
  */
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    PVector gen = new PVector(0,radius);
    float angle=2*PI/vert;
    beginShape();
    vertex(gen.x+location.x,gen.y+location.y);
    for (int i=1; i<=vert*2; i++) {
      gen.rotate(angle/2);
      if (i%2==0) {
        gen.setMag(radius);
      } else {
        gen.setMag(radius/2);
      }
      vertex(gen.x+location.x,gen.y+location.y);
    }
    endShape();
  }
}