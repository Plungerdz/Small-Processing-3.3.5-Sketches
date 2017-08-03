final float rectWidth=120;
final float rectHeight=70;
float recx;
float recy;
float lx;
float ly;

boolean removeFlag=false;

int exitCounter=0;
int score=0;
Digger d1;

ArrayList<Digger> tail = new ArrayList<Digger>();
PFont fontA;

void setup() {
  size(800,800);
  d1= new Digger(width/2,height/2);
  
  recx=random(width);
  recy=random(height);
  strokeWeight(13);
  noStroke();
  fontA=createFont("Arial",60,true);
  textFont(fontA,120);
  textAlign(CENTER);
  textFont(fontA,32);
}

void mousePressed() {
  d1.target(mouseX, mouseY);
}
void checkGoal() {
  boolean goalHorizontal=d1.pos.x>=recx && d1.pos.x<=recx+rectWidth;
  boolean goalVertical=d1.pos.y>=recy && d1.pos.y<=recy+rectHeight;
  if (goalHorizontal && goalVertical) {
    score++;
    tail.add(new Digger(d1.pos.x,d1.pos.y+score*20));
    recx=random(width);
    recy=random(height);
  }
}
void checkIntersect() {
  for (Digger d:tail) {
    if (dist(d.pos.x,d.pos.y,d1.pos.x,d1.pos.x)<=10) {
      removeFlag=true;
    }
  }
  if (removeFlag && tail.size()!=0) {
  tail.remove(tail.size()-1);
  score--;
  removeFlag=false;
  }
}
void draw() {
  background(0);
  text("score: "+score,70,40);
  fill(255,0,255);
  rect(recx,recy,rectWidth,rectHeight);
  fill(255);
  d1.update();
  d1.show();
  lx=d1.pos.x;
  ly=d1.pos.y;
  checkGoal();
  checkIntersect();
  for (Digger d : tail) {
    d.target(lx,ly);
    d.update();
    d.show();
    lx=d.pos.x;
    ly=d.pos.y;
  }
  if (score==10) {
    background(0);
    text("You win!",width/2,height/2);
    
    exitCounter++;
    
  }
  if (exitCounter==60) exit();
}