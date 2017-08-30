class Snake {
  ArrayList<Digger> tail = new ArrayList<Digger>();
  Digger head;
  int score=0;
  int removeFlag=0;
  float lx;
  float ly;
  
  Snake(Digger head_) {
    this.head=head_;
  }
  
  void checkIntersect() {
  for (Digger d:this.tail) {
    if (dist(d.pos.x,d.pos.y,d1.pos.x,d1.pos.x)<=10) {
      this.removeFlag++;
    }
  }
  while (removeFlag>0 && this.tail.size()!=0) {
    this.tail.remove(this.tail.size()-1);
    this.score--;
    this.removeFlag--;
  }
  }
  
  void checkGoal() {
  for (int i = 0 ; i<recx.length; i++) {
    boolean goalHorizontal=this.head.pos.x>=recx[i] && this.head.pos.x<=recx[i]+rectWidth;
    boolean goalVertical=this.head.pos.y>=recy[i] && this.head.pos.y<=recy[i]+rectHeight;
    if (goalHorizontal && goalVertical) {
      this.score++;
      this.tail.add(new Digger(d1.pos.x,d1.pos.y+score*20));
      recx[i]=random(width);
      recy[i]=random(height);
    }
  }
  }
  
  void update() {
    this.head.update();
    this.head.show();
    this.lx=this.head.pos.x;
    this.ly=this.head.pos.y;
    this.checkGoal();
    this.checkIntersect();
    
    for (Digger d : this.tail) {
      d.target(lx,ly);
      d.update();
      d.show();
      lx=d.pos.x;
      ly=d.pos.y;
    }
    
  }
}