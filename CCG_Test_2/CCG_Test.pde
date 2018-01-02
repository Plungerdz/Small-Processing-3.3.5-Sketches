ArrayList<PVector> debugPoints = new ArrayList<PVector>();

//card id's
int globalId=0;
int lifeTotal=10;
int money=20;

//board, hand declaration;
ArrayList<Card> allyBoard;
ArrayList<Card> allyHand;
ArrayList<Card> enemyBoard;
ArrayList<Card> enemyHand;
ArrayList<Button> allyInteract;
ArrayList<Button> enemyInteract;

//finals
final float cardWidth=200;
final float cardHeight=300;
final float cardPadding=30;
final PApplet deep=this;
final int textSize=50;
final int titleSize=30;
final int ruleSize=20;
final float buttonScale=80;
final float buttonSpacing=50;


PFont title;
PFont ruletext;

String rules1="Gain 5 life.";
Card card1;

Card card2;
Card card3;
Card card4;
Card card5;
Card card6;
Card card7;

int checkGuessAgainst(String[] guess, String[] test) {
  int wrong=0;
  for (int i=0; i<3; i++) {
    if (guess[i]!=test[i]) wrong++;
  }
  return wrong;
}

//bpx = board position x
//bpy = board position y
float bpx;
float bpy;

//guess panel stuff
Round guessLeft;
Round guessMid;
Round guessRight;
Button guessDone;
String[] guess = {"W", "W", "W"};
boolean panelActive = false;

void guessPanel(String trans) {
  panelActive = true;
  pushMatrix();
  new Reflect(deep, trans);
  if (guess[0]=="W") fill(255);
  else fill(0);
  guessLeft.display("CENTER");
  if (guess[1]=="W") fill(255);
  else fill(0);
  guessMid.display("CENTER");
  if (guess[2]=="W") fill(255);
  else fill(0);
  guessRight.display("CENTER");
  fill(0, 255, 0);
  guessDone.display("DONE");
  popMatrix();
}


void arrow(float x, float y, float w, float h) {
  beginShape();
  PVector gen = new PVector(x, y);
  vertex(gen.x, gen.y);
  gen.add(0, h/2);
  vertex(gen.x, gen.y);
  gen.add(w, 0);
  vertex(gen.x, gen.y);
  gen.add(0, h/2);
  vertex(gen.x, gen.y);
  gen.add(w/2, -h);
  vertex(gen.x, gen.y);
  gen.add(-w/2, -h);
  vertex(gen.x, gen.y);
  gen.add(0, h/2);
  vertex(gen.x, gen.y);
  gen.add(-w, 0);
  vertex(gen.x, gen.y);
  gen.add(0, h/2);
  vertex(gen.x, gen.y);
  endShape();
}

void setup() {
  // phone width: 1080px
  // phone height: 1794px
  size(1080, 800);
  allyBoard = new ArrayList<Card>();
  allyHand = new ArrayList<Card>();
  enemyBoard = new ArrayList<Card>();
  enemyHand = new ArrayList<Card>();
  allyInteract = new ArrayList<Button>();
  enemyInteract = new ArrayList<Button>();
  card1 = new Card("Spirit Thirst", rules1, "Spell");

  card2 = new Card("Runed Warbot", null, "Being");
  card3 = new Card("Scarred Veteran", null, "Being");
  card4 = new Card("Experimental Chemister", null, "Being");
  card5 = new Card("Experienced Aviator", null, "Being");
  card6 = new Card("Tunnelling Mole", null, "Being");
  card7 = new Card("Exiled Emperor", null, "Being");

  enemyBoard.add(card2);
  enemyBoard.add(card3);
  enemyBoard.add(card4);

  allyBoard.add(card5);
  allyBoard.add(card6);
  allyBoard.add(card7);

  title = createFont("Arial", titleSize, true);
  ruletext = createFont("Verdana", ruleSize, true);
  guessLeft = new Round(-(buttonScale+buttonSpacing), 0, buttonScale, buttonScale, null, null);
  guessMid = new Round(0, 0, buttonScale, buttonScale, null, null);
  guessRight = new Round(buttonScale+buttonSpacing, 0, buttonScale, buttonScale, null, null);
  guessDone = new Button(0, buttonScale/2+buttonSpacing*2, buttonScale*2, buttonScale, "DONE", title);
  rectMode(CENTER);
}

//gtx = guess transform x
//gty = guess transform y
float gtx=1080/3;
float gty=800/2;
Button auxLeft=new Round(-(buttonScale+buttonSpacing)+gtx, gty, buttonScale, buttonScale, null, null);
Button auxMid=new Round(gtx, gty, buttonScale, buttonScale, null, null);
Button auxRight=new Round(buttonScale+buttonSpacing+gtx, gty, buttonScale, buttonScale, null, null);

void firstHandTransform() {
  translate(width/2, height/2);
  scale(0.25);
  rotate(degrees(-270));
}

void boardTransform() {
  translate(bpx, bpy);
}

void guessTransform() {
  translate(width/3, height/2);
}

void mousePressed() {
  debugPoints.add(new PVector(mouseX,mouseY));
  stroke(255,0,0);
  strokeWeight(4);
  for (PVector p : debugPoints) {
     point(p.x,p.y);
  }
  strokeWeight(1);
  stroke(0);
  if (panelActive) {
    if (auxLeft.checkPressed()) {
      println("left");
      if (guess[0]=="W") guess[0]="B";
      else guess[0]="W";
    }
    if (auxMid.checkPressed()) {
      println("mid");
      if (guess[1]=="W") guess[1]="B";
      else guess[1]="W";
    }
    if (auxRight.checkPressed()) {
      println("right");
      if (guess[2]=="W") guess[2]="B";
      else guess[2]="W";
    }
  }
  for (Button b : allyInteract) {
    println(b.checkPressed()); //<>//
    if (b.checkPressed()) println("hey");
  }
}

boolean firsta=true;
boolean firstb=true;
void draw() {
  //card1.display("firstHandTransform");
  //guessPanel("guessTransform");
  
  strokeWeight(1);
  stroke(0);
  bpx = width*0.2;
  bpy = height*0.3;
  for (Card c : enemyBoard) {
    c.display("boardTransform");
    bpx+=cardWidth+cardPadding;
  }
  bpx = width*0.2;
  if (firsta) {
    for (Card c : enemyBoard) {
      enemyInteract.add(new Button(bpx, bpy, cardWidth, cardHeight, null, null));
      bpx+=cardWidth+cardPadding;
    }
    firsta=false;
  }

  bpy=3*height/4;
  bpx = width*0.2;
  for (Card c : allyBoard) {
    c.display("boardTransform");
    bpx+=cardWidth+cardPadding;
  }
  bpx = width*0.2;
  if (firstb) {
    for (Card c : enemyBoard) {
      allyInteract.add(new Button(bpx, bpy, cardWidth, cardHeight, null, null));
      bpx+=cardWidth+cardPadding;
    }
    firstb=false;
  }
  stroke(255,0,0);
  strokeWeight(4);
  for (PVector p : debugPoints) {
     
    point(p.x,p.y);
  }
}