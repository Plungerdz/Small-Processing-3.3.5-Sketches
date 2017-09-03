Stack<PVector> s;
boolean activated=false;

PVector player;

void setup() {
  size(400, 400);
  s = new Stack<PVector>();
  background(51);
  player = new PVector(width/2, height/2);
}

void mousePressed() {
  s.push(new PVector(mouseX,mouseY));
}

void keyPressed() {
  if (key==' ') {
    if (activated==true) activated=false;
    else activated=true;
  }
}
void draw() {
  
  if (activated)
  if (!s.isEmpty()) {
    PVector p= s.peek();
    player.add(p);
    ellipse(player.x,player.y,70,70);
    s.pop();
  }
  
}