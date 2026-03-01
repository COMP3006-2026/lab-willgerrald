void setup() {
  size(500, 400);
  smooth();
  noLoop();
}

void draw() {
  background(240);

  translate(width/2, height/2);

  stroke(0);
  strokeWeight(2);
  fill(255, 0, 0);

  beginShape();
  vertex(0, 60);   // bottom tip

  // left curve
  bezierVertex(-120, 20,
               -120, -80,
               0, -40);

  // right curve
  bezierVertex(120, -80,
               120, 20,
               0, 60);

  endShape(CLOSE);
}
