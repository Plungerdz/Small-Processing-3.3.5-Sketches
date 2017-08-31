color[] colors={#12A467,#DF1D1D,#FFFF00,#BF02FF,#000DB9,#00FFF4};
color pickRandom(color[] a) {
  int r=int(random(a.length));
  return a[r];
}
color c=pickRandom(colors);
color d;
PFont fontA;
float radius=700;
void setup() {
  size(displayWidth, displayHeight);
  fontA=createFont("Arial",60,true);
  textFont(fontA,120);
  textAlign(CENTER);
  textFont(fontA,32);
}
void mousePressed() {
  d=pickRandom(colors);
  while (c==d) d=pickRandom(colors);
  c=d;
}
void draw() {
  fill(c);
  ellipse(width/2,height/2,radius,radius);
}
