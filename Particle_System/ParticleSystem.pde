class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  boolean star;
  
  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
   ParticleSystem(PVector location, boolean star_) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    star=star_;
  }
  
  void addParticle() {
    if (star) {
      particles.add(new StarParticle(origin));
    } else {
      particles.add(new Particle(origin));
    }
    
  }
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
}