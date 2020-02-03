import peasy.*;

PApplet asta = this;
PFont font;
PFont title_font;
Button b;
final int fonth = 90;
final int fontw = 45;
final float padLeft = 40;
final float padDown = 12;
final color normal = #4e39cc;
final color highlighted = #e05802;
final color bgc = #505050;


float avg(float a, float b) {
  return (a+b)/2;
}

ArrayList<IPage> pages;
int current_page = 0;


void setup() {
  size(800, 800, P3D);

  //font-uri
  font = loadFont("ArialNarrow-90.vlw");
  title_font = loadFont("ArialNarrow-Bold-120.vlw");
  textFont(font);

  //pagini
  pages = new ArrayList<IPage>();
  pages.add(new Page_0());
  pages.add(new Page_1());
  pages.add(new Page_2());
  pages.add(new Page_3());
  pages.add(new Page_4());
  pages.add(new Page_5());
  pages.add(new Page_6());
  pages.get(0).setup();
}

void draw() {
  pages.get(current_page).draw();
}

void mousePressed() {
  pages.get(current_page).mousePressed();
}
