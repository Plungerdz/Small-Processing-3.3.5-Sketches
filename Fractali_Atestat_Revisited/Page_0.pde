//start menu

class Page_0 implements IPage {
  private Button b1;
  private Button b2;

  final float horz_tmp = width/2 - 200;
  final float vert_tmp = height * 0.4;


  Page_0() {
  }

  void setup() {

    b1 = new Button(horz_tmp, vert_tmp, 400, 100, "Start");
    b2 = new Button(horz_tmp, 1.6*vert_tmp, 400, 100, "Opțiuni");
  }

  void draw() {
    background(bgc);
    fill(0);
    textFont(title_font);
    textSize(120);
    text("Fractalii în", horz_tmp*0.4, height*0.15);
    text("teoria haosului", horz_tmp*0.4, height*0.15+fonth);
    noFill();
    b1.show();
    b2.show();
  }

  void mousePressed() {
    if (b1.isClicked()) {
      current_page++;
      pages.get(current_page).setup();
    }
  }
}
