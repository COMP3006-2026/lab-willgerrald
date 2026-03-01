void setup() {
  size(600, 600);
  smooth();
  noLoop();
}

void draw() {
  background(180);
  translate(width/2, height/2);

  stroke(0, 255, 255);
  noFill();
  strokeWeight(5);

  beginShape();

  //angle goes around full circle
  for (float angle = 0; angle < TWO_PI * 6; angle += 0.02) {

    //radius oscillates using sine
    float radius = 150 + 60 * sin(5 * angle);

    //convert polar to Cartesian
    float x = radius * cos(angle);
    float y = radius * sin(angle);

    vertex(x, y);
  }

  endShape();
  
  noStroke();
  fill(255, 0, 0);
  ellipse(0, 0, 20, 20);
}
