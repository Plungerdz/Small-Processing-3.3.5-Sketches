ParticleSystem ps;
  
  void setup() {
    size(800, 800);
    ps = new ParticleSystem(new PVector(width/2,20), true);
  }
  
  void draw() {
    background(255);
    ps.addParticle();
    ps.run();
  }