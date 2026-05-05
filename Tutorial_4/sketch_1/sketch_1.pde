void setup() {
  size(600, 400);
  background(255);

  //RED rectangle
  pushMatrix();
  translate(100, 100);
  fill(255, 0, 0);
  rect(0, 0, 100, 60);
  popMatrix();

  //GREEN rectangle
  pushMatrix();
  translate(250, 100);
  fill(0, 255, 0);
  rect(0, 0, 100, 60);
  popMatrix();

  //BLUE rectangle
  pushMatrix();
  translate(100, 220);
  fill(0, 0, 255);
  rect(0, 0, 100, 60);
  popMatrix();

  //CYAN rectangle
  pushMatrix();
  translate(250, 220);
  fill(0, 255, 255);
  rect(0, 0, 100, 60);
  popMatrix();
}
