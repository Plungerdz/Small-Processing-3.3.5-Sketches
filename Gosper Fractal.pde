String lsystem="A";
float degrees=0;
float angle=radians(degrees);
PVector pos;
final float dist=10;

void setup() {
  pos = new PVector(0, 0);
  fullScreen();
  for (int i=0; i<4; i++) {
    update();
    //println(lsystem);
  }
}
void update() {
  String next="";
  for (int i=0; i<lsystem.length(); i++) {
    switch (lsystem.charAt(i)) {
      case 'A': next+="A-B--B+A++AA+B-";
                break;
      case 'B': next+="+A-BB--B-A++A+B";
                break;
      default: next+=lsystem.charAt(i);
               break;
    } 
  }
  lsystem = next;
}
void draw() {
  background(200);
  translate(width/2,height/2);
  scale(1,-1);
  pos.set(0,0);
  degrees+=1;
  if (degrees==360)
    degrees=0;
  angle=radians(degrees);
  PVector disp=new PVector(0, dist);
  for (int i=0; i<lsystem.length(); i++) {
    float iX = pos.x;
    float iY = pos.y;
    switch (lsystem.charAt(i)) {
      case 'A': pos.add(disp);
                break;
      case 'B': pos.add(disp);
                break;
      case '+': disp.rotate(angle);
                break;
      case '-': disp.rotate(-angle);
                break;
    }
    //println(pos.x, pos.y, angle);
    line(iX, iY, pos.x, pos.y);
  }   
}
