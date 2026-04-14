import peasy.*;

PeasyCam cam;

// Rotate a filled circle around the y-axis and x-axis with P3D
void setup() {
size(400, 400, P3D);
fill(204);

//create mouse controlled camera
cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  
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
