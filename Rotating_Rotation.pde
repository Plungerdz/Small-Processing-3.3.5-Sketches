
float branchLength=300;
float rotationAngle=0.01;
int arr=0;

ArrayList<PVector> points= new ArrayList<PVector>();

void setup() {
  size(displayWidth, displayHeight);
  points.add(new PVector(0.0,branchLength));
  strokeWeight(12);
}

void draw() {
  background(200);
  translate(width/2,height/2);
  PVector next =new PVector(0,points.get(arr).y/2);
  arr++;
  points.add(next);
  int i=1;
  for (PVector pos : points) {
    line(0,0,pos.x,pos.y);
    pos.rotate(rotationAngle*i);
    translate(pos.x,pos.y);
    i++;
  }
}
