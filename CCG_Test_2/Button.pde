class Button {
  float x;
  float y;
  float w;
  float h;
  String txt;
  PFont font;

  Button(float x_, float y_, float w_, float h_, String txt_, PFont font_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    txt = txt_;
    font = font_;
  }

  void display() {
    rect(x, y, w, h);
    if (font!=null) {
      fill(0);
      textFont(font, textSize);
      text(txt, x, h+y);
    }
  }

  void display(String option) {
    rect(x, y, w, h);
    if (font!=null) {
      fill(0);
      textFont(font, textSize);
      if (option=="CENTER")
        text(txt, x, h/2+y);
      else if (option=="TOP")
        text(txt, x, y+textSize);
      else if (option=="BOTTOM")
        text(txt, x, h+y);
      else if (option=="DONE")
        text(txt, x-w/2, h/2+y-h/4);
    }
  }

  boolean checkPressed() {
    if (mouseX>=x && mouseX<=x+w && mouseY<=y && mouseY>=y+h) return true;
    else return false;
  }
}