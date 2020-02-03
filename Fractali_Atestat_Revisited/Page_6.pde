//Mandelbrot Fractal

class Page_6 implements IPage {
  private Button b1, b2;
  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;
  
  void setup() {
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");
    colorMode(RGB, 1);
  }
  void draw() {
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
          float twoab = 2.0 * a * b;
          a = aa - bb + x;
          b = twoab + y;
          if (a*a + b*b > 16.0) {
            break;
          }
          n++;
        }

        if (n == maxiterations) {
          pixels[i+j*width] = color(0);
        } else {

          pixels[i+j*width] = color(sqrt(float(n) / maxiterations));
        }
        x += dx;
      }
      y += dy;
    }
    updatePixels();
  }

  void mousePressed() {
    if (b2.isClicked()) {
      current_page--;
      pages.get(current_page).setup();
    } 
  }
}
