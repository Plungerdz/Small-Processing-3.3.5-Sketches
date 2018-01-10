final int startArea=120;
final float disp=30;
PVector[][] dots;
int horz;
int vert;


void quad(PVector a, PVector b, PVector c, PVector d) {
  quad(a.x,a.y,b.x,b.y,c.x,c.y,d.x,d.y);
}

void setup() {
  noStroke();
  size(displayWidth, displayHeight);
  horz=int(width/startArea)+1;
  vert=int(height/startArea)+2;
  dots=new PVector[horz][vert];
  for (int x=0; x<horz; x++) {
    for (int y=0; y<vert; y++) {
      dots[x][y]=new PVector(float(x)*startArea,float(y)*startArea);
    }
  }
  for (int x=1; x<horz-1; x++) {
    for (int y=1; y<vert-1; y++) {
      dots[x][y].add(new PVector(random(-disp,disp),random(-disp,disp)));
    }
  }
}

void draw() {
  for (int x=0; x<horz-1; x++) {
    for (int y=0; y<vert-1; y++) {
      fill((255-x)%255,(255-y)%255,(255-(x+y))%255);
      quad(dots[x][y],dots[x+1][y],dots[x+1][y+1],dots[x][y+1]);
    }
  }

}
