final float moveDist=10;
float y;
float x;

void setup() {
  background(253,0,0);
  size(800, 800);
  x=width/2;
  y=width/2;
  noStroke();
}

void keyPressed() {
  if (key!=CODED)
  switch (key) {
      case 'w': y-=moveDist;
                if (y>height) y=0;
                if (y<0) y=height; 
                break;
      case 'a': x-=moveDist;
                if (x>width) x=0;
                if (x<0) x=width;
                break;
      case 's': y+=moveDist;
                if (y>height) y=0;
                if (y<0) y=height;
                break;
      case 'd': x+=moveDist;
                if (x>width) x=0;
                if (x<0) x=width;
                break;
  }
}
void draw() {
  fill(255,0,0,20);
  rect(0,0,width,height);
  fill(255);
  rect(x,y,25,25);
}