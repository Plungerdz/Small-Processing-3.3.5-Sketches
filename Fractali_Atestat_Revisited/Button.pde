class Button {

  float x, y, w, h;
  String text;

  Button(float x, float y, float w, float h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }

  boolean isClicked() {
    return (((mouseX>=this.x) && (mouseX<=this.x+this.w)) && 
      ((mouseY>=this.y) && (mouseY<=this.y+this.h))) && 
      mousePressed;
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    smooth();
    fill((isClicked()) ? highlighted : normal);
    rect(x, y, w, h);
    fill(0);
    textFont(font);
    textSize(90);
    pushMatrix();
    translate((current_page==0) ? padLeft+x : 5+x, y+fonth-padDown);
    scale(w/(text.length()*fontw), 1);
    text(text, 0, 0);
    popMatrix();
  }
}
