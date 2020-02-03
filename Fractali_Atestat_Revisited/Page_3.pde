//Chaos Game

class Page_3 implements IPage {
  private Button b1, b2;
  final float horz_tmp = width*0.03;
  final float vert_tmp = height * 0.83;

  ArrayList<PVector> points;
  final int n=6;
  final float size=400;
  final float percent=0.60;
  PVector center;
  PVector pt;

  <T> T pickRandom(ArrayList<T> a) {
    return a.get(int(random(a.size())));
  }

  PVector lerpv(PVector a, PVector b, float amt) {
    return new PVector(lerp(a.x, b.x, amt), lerp(a.y, b.y, amt));
  }

  Page_3() {
  }

  void draw() {
    for (PVector p : points) {
      point(p.x, p.y);
    }
    for (int i=0; i<50; i++) {
      pt = lerpv(pt, pickRandom(points), percent);
      stroke(255, 200, 0, 25);
      point(pt.x, pt.y);
    }
    b1.show();
    b2.show();
  }

  void setup() {
    background(bgc);
    b1 = new Button(width-270, vert_tmp, 250, 100, "Următorul");
    b2 = new Button(horz_tmp, vert_tmp, 250, 100, "Precedentul");
    float ainc=TWO_PI/n;
    center = new PVector(width/2, height/2);
    points = new ArrayList<PVector>();
    for (int i=0; i<n; i++) {
      PVector p=PVector.fromAngle(i*ainc);
      p.mult(size);
      p.add(center);
      points.add(p);
    }
    pt = new PVector(center.x, center.y);
    strokeWeight(8);
    background(bgc);
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
