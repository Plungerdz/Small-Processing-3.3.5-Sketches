class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255;
  PImage img;
  
  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location = l.get();
  }
  
  Particle(PVector l, PImage img_) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location = l.get();
    img=img_;
  }
  
  
  Particle() {
    PVector l = new PVector(random(width),random(height));
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location = l.get();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  /*
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
  */
  void render() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,location.x,location.y,60,60);
  }
}