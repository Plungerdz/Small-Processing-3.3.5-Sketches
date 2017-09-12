ParticleSystem ps;
  
  void setup() {
    size(640, 400, P2D);
    
    PImage img = loadImage("smoke.png");
    ps = new ParticleSystem(img);
  }
  
  void draw() {
    background(0);
    blendMode(ADD);
    PVector gravity = new PVector(0,0.05);
    ps.applyForce(gravity);
    
    if (mousePressed) {
      PVector wind = new PVector(0.1,0);
      ps.applyForce(wind);
    }
    ps.addParticle();
    ps.run();
    
  }