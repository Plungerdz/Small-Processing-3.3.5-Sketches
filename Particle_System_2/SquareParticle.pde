class SquareParticle extends Particle {
  
  SquareParticle(PVector l) {
    super(l);
  }
  
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    rectMode(CENTER);
    rect(location.x, location.y, 16, 16);
  }

}