float defaultSize = 25;
float size=0;
String current="rect";
PFont font;
float textx;
float my;

void setup() {
  size(800,800);
  background(0);
  noStroke();
  font=loadFont("Monospaced.plain-48.vlw");
  textFont(font, 24);
  textAlign(CENTER);
  textx=width/2;
  write();
}

void draw() {  
   my = constrain(mouseY, 336+2*defaultSize, height);
}

void write() {
  text("q - RECTANGLE TOOL", textx,50);
  text("w - SQUARE TOOL", textx,98);
  text("e - CIRCLE TOOL", textx,146);
  text("r - ELLIPSE TOOL", textx,192);
  text("Space - CLEAR SCREEN", textx,240);
  text("Mouse Wheel - CHANGE SIZE, b - ERASE TOOL", textx,288);
  text("D - DEFAULT SIZE", textx,336);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if ((e == 1 && size > -23) || (e == -1 && size < 48)) {
    size -= 2*e;
  }
}

void mousePressed() {
  switch (current) {
    case "rect":  fill(255);
                  rect(mouseX,my,defaultSize+size,defaultSize*2+size);
                  break;
    case "sqr":   fill(255);
                  rect(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
    case "circ":  fill(255);
                  ellipse(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
    case "elps":  fill(255);
                  ellipse(mouseX,my,defaultSize+size,defaultSize*2+size);
                  break;
    case "erase": fill(0);
                  rect(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
  }
}

void mouseDragged() {
  switch (current) {
    case "rect":  fill(255);
                  rect(mouseX,my,defaultSize+size,defaultSize*2+size);
                  break;
    case "sqr":   fill(255);
                  rect(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
    case "circ":  fill(255);
                  ellipse(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
    case "elps":  fill(255);
                  ellipse(mouseX,my,defaultSize+size,defaultSize*2+size);
                  break;
    case "erase": fill(0);
                  rect(mouseX,my,defaultSize+size,defaultSize+size);
                  break;
  }
}

void keyPressed() {
  if (key!=CODED) {
    switch (key) {
      case ' ': background(0);
                fill(255);
                write();
                break;
      case 'q': current="rect";
                break;
      case 'w': current="sqr";
                break;
      case 'e': current="circ";
                break;
      case 'r': current="elps";
                break;
      case 'b': current="erase";
                break;
      case 'd': size=0;
                break;
      default: break;
    }
  }
  
}