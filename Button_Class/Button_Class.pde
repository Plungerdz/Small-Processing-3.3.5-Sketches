
int checkGuessAgainst(String[] guess, String[] test) {
  int wrong=0;
  for (int i=0; i<3; i++) {
    if (guess[i]!=test[i]) wrong++;
  }
  return wrong;
}

Button b;
Round r;
PFont font;
final int textSize = 50;
final int padding = 50;

void setup() {
  size(800, 800);
  font = createFont("Arial",30);
  b = new Button(width/2,height/2,300,300,"Click me!",font);
  r = new Round(width/2,height/2,300,300,"Click me!",font);
}

void mousePressed() {
  if (b.checkPressed()) {
    println("true");
  }
  if (r.checkPressed()) {
    println("also true");
  }
}

void draw() {
  fill(255);
  b.display("TOP");
  fill(255);
  r.display("BOTTOM");
}