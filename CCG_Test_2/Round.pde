class Round extends Button {

  Round(float x_, float y_, float w_, float h_, String txt_, PFont font_) {
    super(x_, y_, w_, h_, txt_, font_);
  }

  void display() {
    ellipse(x, y, w, h);
    if (font!=null) {
      fill(0);
      textFont(font, textSize);
      //text(txt, x-w/2, h+y-h/2);
      text(txt, x-w/2, h/2+y);
    }
  }

  void display(String option) {
    ellipse(x, y, w, h);
    if (font!=null) {
      fill(0);
      textFont(font, textSize);
      if (option=="CENTER")
        text(txt, x-w/2, y);
      else if (option=="TOP")
        text(txt, x-w/2, y+textSize-h/2);
      else if (option=="BOTTOM")
        //text(txt, x-w/2, h+y-h/2);
        text(txt, x-w/2, h/2+y);
    }
  }

  boolean checkPressed() {
    if (sq(mouseX-x)+sq(mouseY-y)<sq(max(w, h)/2)) return true;
    else return false;
  }
}