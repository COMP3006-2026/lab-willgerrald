void setup() {
  size(600, 400);
  background(255);

  //original shapes
  fill(255, 0, 0); // 1st shape (RED)
  rect(100, 150, 100, 60);

  fill(0, 255, 0); // 2nd shape (GREEN)
  rect(300, 150, 100, 60);

  //transformed shapes
  //rotate 1st shape around its CENTRE (45°)
  pushMatrix();
  translate(100 + 50, 150 + 30);   //move to centre
  rotate(radians(45));
  fill(255, 0, 0);
  rect(-50, -30, 100, 60);         //draw from centered point
  popMatrix();

  //Rotate 2nd shape around its TOP-LEFT corner (90°)
  pushMatrix();
  translate(300, 150);             // move to top-left
  rotate(radians(90));
  fill(0, 255, 0);
  rect(0, 0, 100, 60);             
  popMatrix();
}
