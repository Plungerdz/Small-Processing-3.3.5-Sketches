final float rectWidth=120;
final float rectHeight=70;
final int winScore=20;
final int pickupCount=3;
float[] recx;
float[] recy;
float lx;
float ly;
float mx;
float my;

int removeFlag=0;

int exitCounter=0;
int score=0;

Digger d1;
Digger e1;

ArrayList<Digger> tail = new ArrayList<Digger>();
ArrayList<Digger> enemy = new ArrayList<Digger>();

PFont fontA;

void setup() {
  recx = new float[pickupCount];
  recy = new float[pickupCount];
  size(1200,800);
  d1= new Digger(width/2, height/2);
  e1= new Digger(width/2, height/2);
  for (int i=0; i<recx.length; i++) {
    recx[i]=random(width);
    recy[i]=random(height);
  }
  
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

void draw() {
  background(0);
  fill(255);
  text("score: "+score,70,40);
  
  for (int i = 0 ; i<recx.length; i++) {
    fill(255,0,255);
    rect(recx[i],recy[i],rectWidth,rectHeight);
  }
  
  fill(255);
  d1.update();
  d1.show();
  lx=d1.pos.x;
  ly=d1.pos.y;
  checkGoal();
  checkIntersect();
  if (score!=winScore) {
    for (Digger d : tail) {
    d.target(lx,ly);
    d.update();
    d.show();
    lx=d.pos.x;
    ly=d.pos.y;
  }
  }
  
  if (score==winScore) {
    background(0);
    text("You win!",width/2,height/2);
    exitCounter++;
  }
  if (exitCounter==60) exit();
}

void checkGoal() {
  for (int i = 0 ; i<recx.length; i++) {
    boolean goalHorizontal=d1.pos.x>=recx[i] && d1.pos.x<=recx[i]+rectWidth;
    boolean goalVertical=d1.pos.y>=recy[i] && d1.pos.y<=recy[i]+rectHeight;
    if (goalHorizontal && goalVertical) {
      score++;
      tail.add(new Digger(d1.pos.x,d1.pos.y+score*20));
      recx[i]=random(width);
      recy[i]=random(height);
    }
  }
}

void checkIntersect() {
  for (Digger d:tail) {
    if (dist(d.pos.x,d.pos.y,d1.pos.x,d1.pos.x)<=10) {
      removeFlag++;
    }
  }
  while (removeFlag>0 && tail.size()!=0) {
  tail.remove(tail.size()-1);
  score--;
  removeFlag--;
  }
}