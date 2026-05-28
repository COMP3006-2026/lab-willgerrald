float rectX, rectY, rectW, rectH;
float circleX, circleY, circleSize;

int selectedShape = 0;   // 0 = none, 1 = rectangle, 2 = circle
float offsetX, offsetY;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  ellipseMode(CENTER);

  // random sizes
  rectW = random(80, 140);
  rectH = random(50, 100);
  circleSize = random(60, 120);

  // starting positions
  rectX = 180;
  rectY = 200;
  circleX = 420;
  circleY = 200;
}

void draw() {
  background(255);

  //draw rectangle
  if (selectedShape == 1) {
    stroke(255, 0, 0);
    strokeWeight(3);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  fill(100, 150, 255);
  rect(rectX, rectY, rectW, rectH);

  // draw circle
  if (selectedShape == 2) {
    stroke(255, 0, 0);
    strokeWeight(3);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  fill(255, 180, 80);
  ellipse(circleX, circleY, circleSize, circleSize);

  fill(0);
  textSize(16);
  text("Click and drag a shape", 20, 30);
}

void mousePressed() {
  //check rectangle first
  if (mouseX > rectX - rectW/2 && mouseX < rectX + rectW/2 &&
      mouseY > rectY - rectH/2 && mouseY < rectY + rectH/2) {
    selectedShape = 1;
    offsetX = rectX - mouseX;
    offsetY = rectY - mouseY;
  }
  //check circle
  else if (dist(mouseX, mouseY, circleX, circleY) < circleSize/2) {
    selectedShape = 2;
    offsetX = circleX - mouseX;
    offsetY = circleY - mouseY;
  }
  else {
    selectedShape = 0;
  }
}

void mouseDragged() {
  if (selectedShape == 1) {
    rectX = mouseX + offsetX;
    rectY = mouseY + offsetY;
  }
  else if (selectedShape == 2) {
    circleX = mouseX + offsetX;
    circleY = mouseY + offsetY;
  }
}

void mouseReleased() {
  selectedShape = 0;
}
