//Julia Set

class Page_5 implements IPage {
  private Button b1, b2;
  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;
  float angle = 0;

  Page_5() {
  }
  void setup() {
    colorMode(HSB, 1);
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");
  }
  void draw() {
    float ca = cos(angle*3.213);
    float cb = sin(angle);
    angle += 0.02;
    background(255);
    float w = 5;
    float h = (w * height) / width;


    float xmin = -w/2;
    float ymin = -h/2;

    loadPixels();


    int maxiterations = 100;


    float xmax = xmin + w;

    float ymax = ymin + h;


    float dx = (xmax - xmin) / (width);
    float dy = (ymax - ymin) / (height);


    float y = ymin;
    for (int j = 0; j < height; j++) {

      float x = xmin;
      for (int i = 0; i < width; i++) {


        float a = x;
        float b = y;
        int n = 0;
        while (n < maxiterations) {
          float aa = a * a;
          float bb = b * b;

          if (aa + bb > 4.0) {
            break;
          }
          float twoab = 2.0 * a * b;
          a = aa - bb + ca;
          b = twoab + cb;
          n++;
        }


        if (n == maxiterations) {
          pixels[i+j*width] = color(0);
        } else {

          float hu = sqrt(float(n) / maxiterations);
          pixels[i+j*width] = color(hu, 255, 150);
        }
        x += dx;
      }
      y += dy;
    }
    updatePixels();
    b1.show();
    b2.show();
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
