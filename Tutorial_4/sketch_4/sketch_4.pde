void setup() {
  size(600, 400);
  background(255);

  // First shape (normal)
  fill(255, 0, 0);
  rect(100, 150, 100, 60);

  // SECOND shape scaled multiple times
  for (int i = 1; i <= 5; i++) {

    pushMatrix();

    translate(350, 180);   // position of second shape
    scale(i * 0.3);        // increase scale each loop

    fill(0, 255, 0);
    rect(-50, -30, 100, 60);

    popMatrix();
  }

  // Third shape (normal)
  fill(0, 0, 255);
  rect(100, 260, 100, 60);

  // Fourth shape (normal)
  fill(0,255, 255);
  rect(350, 260, 100, 60);
}
