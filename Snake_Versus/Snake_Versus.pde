final float rectWidth=120;
final float rectHeight=70;

final int winScore=20;
final int pickupCount=3;

float error;

float[] recx;
float[] recy;


int exitCounter=0;


Snake player;
Snake enemy;

Digger d1;
Digger e1;

PFont fontA;

void setup() {
  
  recx = new float[pickupCount];
  recy = new float[pickupCount];
  size(1200,800);
  error = width;
  d1= new Digger(width/2, height/2);
  e1= new Digger(width/2, height/2);
  player = new Snake(d1);
  enemy = new Snake(e1);
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
  player.head.target(mouseX, mouseY);
}

void draw() {
  background(0);
  fill(255);
  for (int i = 0 ; i<recx.length; i++) {
    fill(255,0,255);
    rect(recx[i],recy[i],rectWidth,rectHeight);
  }
  
  fill(255,255,255);
  if (player.score<winScore) {
    player.update();
  }
  
  fill(255,255,0,200);
  if (player.score<winScore) {
    enemyThink();
    enemy.update();
  }
  fill(255);
  text("Your score: "+player.score,70,40);
  text("Enemy score: "+enemy.score,70,80);
  if (player.score>=winScore) {
    background(0);
    fill(255);
    text("You win!",width/2,height/2);
    exitCounter++;
  }
  if (enemy.score>=winScore) {
    background(0);
    fill(255);
    text("You lose!",width/2,height/2);
    exitCounter++;
  }
  if (exitCounter==60) exit();
  fill(255);
  
}

void enemyThink() {
  int bestRect = -1;
  float minDist = 10e10;
  for (int i = 0 ; i<recx.length; i++) {
    float space=dist(recx[i],recy[i],enemy.head.pos.x,enemy.head.pos.y);
    if (space<minDist) {
      bestRect = i;
      minDist = space;
    }
  }
  enemy.head.target(recx[bestRect]+rectWidth/2+random(-error/2,error/2),recy[bestRect]+rectHeight/2+random(-error/2,error/2));
}