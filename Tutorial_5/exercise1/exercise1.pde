float rectX = 150;
float rectY = 200;
float rectW = 100;
float rectH = 60;

float circleX = 350;
float circleY = 200;
float circleSize = 80;

int selectedShape = 1;   // 1 = rectangle, 2 = circle
float moveStep = 10;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textSize(16);
}

void draw() {
  background(255);

  // instructions
  fill(0);
  text("Press 1 to select rectangle", 20, 30);
  text("Press 2 to select circle", 20, 55);
  text("Use arrow keys to move selected shape", 20, 80);

  // draw rectangle
  if (selectedShape == 1) {
    stroke(255, 0, 0);   // highlight selected shape
    strokeWeight(3);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  fill(100, 150, 255);
  rect(rectX, rectY, rectW, rectH);

  // draw circle
  if (selectedShape == 2) {
    stroke(255, 0, 0);   // highlight selected shape
    strokeWeight(3);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  fill(255, 180, 80);
  ellipse(circleX, circleY, circleSize, circleSize);
}

void keyPressed() {
  // select shape
  if (key == '1') {
    selectedShape = 1;
  } 
  else if (key == '2') {
    selectedShape = 2;
  }

  // move selected shape with arrow keys
  if (selectedShape == 1) {
    if (keyCode == UP) {
      rectY -= moveStep;
    } else if (keyCode == DOWN) {
      rectY += moveStep;
    } else if (keyCode == LEFT) {
      rectX -= moveStep;
    } else if (keyCode == RIGHT) {
      rectX += moveStep;
    }
  } 
  else if (selectedShape == 2) {
    if (keyCode == UP) {
      circleY -= moveStep;
    } else if (keyCode == DOWN) {
      circleY += moveStep;
    } else if (keyCode == LEFT) {
      circleX -= moveStep;
    } else if (keyCode == RIGHT) {
      circleX += moveStep;
    }
  }
}
