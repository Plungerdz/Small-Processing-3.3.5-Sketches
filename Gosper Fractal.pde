String lsystem="";

void setup() {
  size(displayWidth,displayHeight);
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
}
void draw() {
  translate(width/2,height/2);
  scale(1,-1);
}
