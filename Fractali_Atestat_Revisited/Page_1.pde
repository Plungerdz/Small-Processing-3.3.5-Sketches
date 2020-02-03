//Sierpinski fractal

class Page_1 implements IPage {
  private Button b1, b2;
  private String lsystem="A";
  private final float angle=PI/3;
  private PVector pos;
  private final float dist=15;

  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;

  Page_1() {
  }

  void draw() {
    background(bgc);
    pushMatrix();
    stroke(#EF17FF);
    strokeWeight(10);
    translate(width*0.2, height*0.75);
    scale(0.3, -0.3);
    rotate(-PI/6);
    pos.set(0, 0);
    PVector disp=new PVector(0, dist);
    for (int i=0; i<lsystem.length(); i++) {
      float iX = pos.x;
      float iY = pos.y;
      switch (lsystem.charAt(i)) {
      case 'A': 
        pos.add(disp);
        break;
      case 'B': 
        pos.add(disp);
        break;
      case '+': 
        disp.rotate(angle);
        break;
      case '-': 
        disp.rotate(-angle);
        break;
      }

      line(iX, iY, pos.x, pos.y);
    }
    popMatrix();
    b1.show();
    //b2.show();
  }

  void setup() {
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");

    pos = new PVector(0, 0);
    for (int i=0; i<7; i++) update();
    strokeWeight(10);
  }

  private void update() {
    String next="";
    for (int i=0; i<lsystem.length(); i++) {
      switch (lsystem.charAt(i)) {
      case 'A': 
        next+="B-A-B";
        break;
      case 'B': 
        next+="A+B+A";
        break;
      default: 
        next+=lsystem.charAt(i);
        break;
      }
    }
    lsystem = next;
  }

  void mousePressed() {
    if (b1.isClicked()) {
      current_page++;
      pages.get(current_page).setup();
    } 
    //if (b2.isClicked()) {
    //  current_page--;
    //  pages.get(current_page).setup();
    //}
  }
}
