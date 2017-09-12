class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  
  ParticleSystem(PImage img_) {
    origin = new PVector(width/2,50);
    particles = new ArrayList<Particle>();
    img=img_;
  }
  
  void addParticle() {
    particles.add(new Particle(origin,img));
  }
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.render();
      
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void applyForce(PVector force) {
    for (Particle p: particles) {
      p.applyForce(force);
    }
  }
}