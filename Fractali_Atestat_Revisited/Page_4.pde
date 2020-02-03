//Lorenz Attractor

class Page_4 implements IPage {
  private Button b1, b2;
  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;
  float x = 0.01;
  float y = 0;
  float z = 0;

  Page_4() {
  }
  float a = 10;
  float b = 28;
  float c = 8.0/3.0;

  ArrayList<PVector> points = new ArrayList<PVector>();

  PeasyCam cam;

  void setup() {
    colorMode(HSB);
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");
    cam = new PeasyCam(asta, 500);
  }

  void draw() {
    background(bgc);
    float dt = 0.01;
    float dx = (a * (y - x))*dt;
    float dy = (x * (b - z) - y)*dt;
    float dz = (x * y - c * z)*dt;
    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(0, 0, -80);
    //translate(width/2, height/2);
    scale(5);
    stroke(255);
    noFill();

    float hu = 0;
    beginShape();
    for (PVector v : points) {
      stroke(hu, 255, 255);
      vertex(v.x, v.y, v.z);
      //PVector offset = PVector.random3D();
      //offset.mult(0.1);
      //v.add(offset);

      hu += 0.1;
      if (hu > 255) {
        hu = 0;
      }
    }
    endShape();

    b1.show();
    b2.show();
    //println(x,y,z);
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
