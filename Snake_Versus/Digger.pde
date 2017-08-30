class Digger {
  PVector pos;
  PVector vel= new PVector(0,0);
  PVector acc= new PVector(0,0);
  
  
  Digger(float x, float y) {
    pos= new PVector(x,y);
   
  }
  
  void target(float tx, float ty) {
    this.acc.x=tx-pos.x;
    this.acc.y=ty-pos.y;
    this.acc.normalize();
    this.acc.mult(4);
  }
  
  void update() {
    this.vel.add(acc);
    this.vel.limit(20);
    this.vel.mult(0.99);
    this.pos.add(vel);
    
  if ((this.pos.y>height) || (this.pos.y<0)) {
    this.vel.y*=-1;
    this.acc.y*=-1;
  }
  if ((this.pos.x>width) || (this.pos.x<0)) {
    this.vel.x*=-1;
    this.acc.x*=-1;
  }
  
  }
  
  void show() {
   
    ellipse(this.pos.x,this.pos.y,40,40);
  }
}