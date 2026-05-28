void setup() {
  size(600, 400);
  background(255);

  // Rectangle 1 - RED
  pushMatrix();
  translate(100, 100);
  fill(255, 0, 0);
  rect(0, 0, 100, 60);
  popMatrix();

  // Rectangle 2 - GREEN
  pushMatrix();
  translate(250, 100);
  fill(0, 255, 0);
  rect(0, 0, 100, 60);
  popMatrix();

  // Rectangle 3 - BLUE
  pushMatrix();
  translate(100, 220);
  fill(0, 0, 255);
  rect(0, 0, 100, 60);
  popMatrix();

  // Rectangle 4 - CYAN (STAYS ORIGINAL POSITION)
  pushMatrix();
  fill(0, 255, 255);
  rect(0, 0, 100, 60);
  popMatrix();
}
