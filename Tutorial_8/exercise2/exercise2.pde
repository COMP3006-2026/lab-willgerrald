// Rotate a filled pentagon around the y-axis and x-axis with P3D
void setup() {
size(400, 400, P3D);
fill(204);
}
void draw() {
  background(0);
  
  translate(width/2, height/2, -width);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  
  noStroke();
  float r = 150; //pentagon radius
  
  beginShape();
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i - HALF_PI;
    float x = cos(angle) * r;
    float y = sin(angle) * r;
    vertex(x, y, 0);
  }
  endShape(CLOSE);
  
  stroke(255);
  line(0, 0, -200, 0, 0, 200);
}
