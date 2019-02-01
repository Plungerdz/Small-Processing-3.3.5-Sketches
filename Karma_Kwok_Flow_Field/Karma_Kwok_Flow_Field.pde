final float squareWidth=25;
final float jitterMagnitude=1.2;
final color[] colorChoices = {#FFBE0B, #5174FF, #FB5607, #FF006E, #8338EC};

ArrayList<Perturbator> vertices;
//ArrayList<ColorWrapper> quadColors;
int rows;
int cols;

int DEBUG_EXCEPTION_COUNT = 0;

<T> ArrayList<T> shuffle(ArrayList<T> a) {
  ArrayList<T> v;
  v=a;
  for (int i=v.size()-1; i>0; i--) {
    int j=floor(random(i));
    T aux=v.get(j);
    v.set(j, v.get(i));
    v.set(i, aux);
  }
  return v;
}

void setup() {
  size(800, 800, P2D);
  vertices = new ArrayList<Perturbator>();

  rows = int(width/squareWidth);
  cols = int(height/squareWidth);
  //println(rows, " ", cols);
  for (float i=1; i<rows; i++) {
    for (float j=1; j<cols; j++) {
      vertices.add(new Perturbator(100, new PVector(i*squareWidth, j*squareWidth)));
    }
  }
  rows--;
  cols--;
  
  int cindex=0;
  for (int i=0; i<rows-1; i++) {
    for (int j=0; j<cols-1; j++) {
      //cindex++;
      //quadColors.add(new ColorWrapper(colorChoices[0]));
      //if (cindex>3) cindex=0;
    }
  }
  smooth();
  //println("rows: "+rows+" collumns: "+cols);
}

void line(PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}

void point(PVector p) {
  point(p.x, p.y);
}

void quad(PVector a, PVector b, PVector c, PVector d) {
  quad(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
}

void line(Perturbator a, Perturbator b) {
  line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
}

void point(Perturbator p) {
  point(p.pos.x, p.pos.y);
}

void quad(Perturbator x, Perturbator y, Perturbator z, Perturbator w) {
  PVector a = x.pos;
  PVector b = y.pos;
  PVector c = z.pos;
  PVector d = w.pos;
  quad(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
}

Perturbator vertexAt(int i, int j) {
  return vertices.get(j+i*cols);
}

void draw() {
  background(30);
  strokeWeight(7);
  noStroke();
  //fill(160);
  //stroke(160);
  //noFill();
  
  //for (int i=0; i<rows; i++) {
  //  for (int j=0; j<cols; j++) {
  //    try {
  //      point(vertexAt(i, j));
  //    } 
  //    catch (Throwable t) {
  //      DEBUG_EXCEPTION_COUNT++;
  //      println("EXCEPTEE "+i+" , "+j);
  //    }
  //  }
  //}

  for (int i=0; i<rows-1; i++) {
    for (int j=0; j<cols-1; j++) {
      try {
        fill(colorChoices[(j+i*cols)%5]);
        quad(vertexAt(i, j), vertexAt(i+1, j), vertexAt(i+1, j+1), vertexAt(i, j+1));
      } 
      catch (Throwable t) {
        DEBUG_EXCEPTION_COUNT++;
        println("EXCEPTEE "+i+" , "+j);
      }
    }
  }


  //for (int i=0; i<rows-1; i++) {
  //  for (int j=0; j<cols-1; j++) {
  //    line(vertexAt(i, j), vertexAt(i+1, j+1));
  //  }
  //}
  for (Perturbator p : vertices) {
    //PVector mouseVec = new PVector(mouseX, mouseY);
    //mouseVec.setMag(0.01);
    //p.pos.add(mouseVec);
    p.update();
  }
}
