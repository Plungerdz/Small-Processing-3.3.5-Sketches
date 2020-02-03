//Barnsley's fern

class Page_2 implements IPage {
  private Button b1, b2;
  private float x, y;
  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;

  Page_2() {
  }

  void draw() {
    for (int i = 0; i < 100; i++) {
      drawPoint();
      nextPoint();
    }
    b1.show();
    b2.show();
  }

  private void drawPoint() {
    stroke(34, 139, 34);
    strokeWeight(1);
    float px = map(x, -2.1820, 2.6558, 0, width);
    float py = map(y, 0, 9.9983, height, 0);
    point(px, py);
  }

  void nextPoint() {
    float nextX, nextY;
    float r = random(1);
    if (r < 0.01) {
      nextX =  0;
      nextY =  0.16 * y;
    } else if (r < 0.86) {
      nextX =  0.85 * x + 0.04 * y;
      nextY = -0.04 * x + 0.85 * y + 1.6;
    } else if (r < 0.93) {
      nextX =  0.20 * x - 0.26 * y;
      nextY =  0.23 * x + 0.22 * y + 1.6;
    } else {
      nextX = -0.15 * x + 0.28 * y;
      nextY =  0.26 * x + 0.24 * y + 0.44;
    }
    x = nextX;
    y = nextY;
  }

  void setup() {
    background(bgc);
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");
  }

  void mousePressed() {
    if (b1.isClicked()) {
      current_page++;
      pages.get(current_page).setup();
    } else if (b2.isClicked()) {
      current_page--;
      pages.get(current_page).setup();
    }
  }
}
