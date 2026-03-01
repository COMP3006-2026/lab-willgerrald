void setup() {
  size(600, 400);
  smooth();
  background(255);
  noLoop();
}

void draw() {
  background(255);

  //plotting settings
  float xMin = -1;
  float xMax =  1;

  //scale
  float margin = 50;
  float plotW = width - 2*margin;
  float plotH = height - 2*margin;

  stroke(0);
  strokeWeight(2);
  noFill();

  beginShape();
  for (float x = xMin; x <= xMax; x += 0.005) {
    float y = 1 - pow(x, 4);   // y = 1 - x^4

    //map x from [-1,1] to screen X
    float sx = map(x, xMin, xMax, margin, margin + plotW);

    //y range is [0,1], map to screen Y 
    float sy = map(y, 0, 1, margin + plotH, margin);

    vertex(sx, sy);
  }
  endShape();
}
