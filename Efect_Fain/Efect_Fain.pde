void setup() {
  size(1820,720);
  
  fill(0,25);
  strokeWeight(22);
}
void draw() {
  stroke(0,25);
  rect(0,0,width,height);
  stroke(millis()%255,(abs(60-millis()))%255,(abs(120-millis()))%255);
  
  point(mouseX,mouseY);
}