class colorPoint {
  color c;
  PVector pos;
  
  colorPoint(color c_, PVector pos_) {
    c=c_;
    pos=pos_;
  }
  
  colorPoint() {
   
  }
  
  void show() {
    stroke(c);
    point(pos.x,pos.y);
  }
}