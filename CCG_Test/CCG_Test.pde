//card id's
int globalId=0;
int lifeTotal=10;
int money=20;

//board, hand declaration;
ArrayList<Card> allyBoard;
ArrayList<Card> allyHand;
ArrayList<Card> enemyBoard;
ArrayList<Card> enemyHand;

float cardWidth;
float cardHeight;

PFont title;
PFont ruletext;

String rules1="Gain 5 life.";
Card card1;
PApplet deep;

void setup() {
  // phone width: 1080px
  // phone height: 1794
  size(1080, 1000);
  allyBoard = new ArrayList<Card>();
  allyHand = new ArrayList<Card>();
  enemyBoard = new ArrayList<Card>();
  enemyHand = new ArrayList<Card>();
  card1 = new Card("Spirit Thirst",rules1,"Spell");
  title = createFont("Arial",60,true);
  ruletext = createFont("Verdana",40,true);
  deep = this;
  cardWidth=360;
  cardHeight=448.5;
  rectMode(CENTER);
}

void draw() {
  card1.display(width/2,height/2);
  
}



  