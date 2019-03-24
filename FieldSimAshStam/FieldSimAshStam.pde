float t = 0;

Fluid fluid;

void settings() {
  size(N*SCALE, N*SCALE);
}

void setup() {
  fluid = new Fluid(0.1, 0, 0.000001);

}

//void mouseDragged() {
//  fluid.addDensity(mouseX/SCALE, mouseY/SCALE, 100f);
//  float amtX = mouseX - pmouseX;
//  float amtY = mouseY - pmouseY;
//  fluid.addVelocity(mouseX/SCALE, mouseY/SCALE, amtX, amtY);
//}

void mouseDragged() {
  
  
}
void draw() {
  background(0);
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5*height/SCALE);
  for (int i = -1; i <=1; i++) {
    for (int j = -1; j <=1; j++) {
      fluid.addDensity(cx+i, cy+j, random(100, 500));
    }
  }
  
  float angle = noise(t) * TWO_PI * 2;
  PVector v = PVector.fromAngle(angle);
  v.mult(5);
  t += 0.1;
  fluid.addVelocity(cx, cy, v.x, v.y);
  //float amtX = map(noise(t), 0, 1, -1, 1);
  //float amtY = map(noise(t+1000), 0, 1, -1, 1);
  //fluid.addVelocity(cx, cy, amtX, amtY);
  fluid.step();
  fluid.renderD();
  //fluid.renderV();
  //if (millis()%1000==0) 
  fluid.fadeD();
}
