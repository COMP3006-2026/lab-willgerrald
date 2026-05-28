void setup() {
  size(600, 400);
  background(255);

  // Rectangle 1 - RED (rotated 30 degrees)
  pushMatrix();
  translate(100, 100);   // move to position
  rotate(radians(30));   // rotate
  fill(255, 0, 0);
  rect(-50, -30, 100, 60); 
  popMatrix();

  // Rectangle 2 - GREEN (rotated 45 degrees)
  pushMatrix();
  translate(250, 100);
  rotate(radians(45));
  fill(0, 255, 0);
  rect(-50, -30, 100, 60);
  popMatrix();

  // Rectangle 3 - BLUE (rotated 60 degrees)
  pushMatrix();
  translate(100, 220);
  rotate(radians(60));
  fill(0, 0, 255);
  rect(-50, -30, 100, 60);
  popMatrix();

  // Rectangle 4 - CYAN (rotated 90 degrees)
  pushMatrix();
  translate(250, 220);
  rotate(radians(90));
  fill(0, 255, 255);
  rect(-50, -30, 100, 60);
  popMatrix();
}
