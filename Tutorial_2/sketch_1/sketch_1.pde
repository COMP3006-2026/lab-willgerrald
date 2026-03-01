//Button positions and size
int btnWidth = 150;
int btnHeight = 60;

int btn1X = 100;
int btn2X = 300;
int btn3X = 500;
int btnY  = 200;

void setup() {
  size(750, 500);
}

void draw() {
  background(220);

  //draw first button (red button)
  if (isMouseOver(btn1X, btnY, btnWidth, btnHeight)) {
    fill(255, 0, 0);   // Red
  } else {
    fill(180);         // Gray
  }
  rect(btn1X, btnY, btnWidth, btnHeight);

  //draw second button (green button)
  if (isMouseOver(btn2X, btnY, btnWidth, btnHeight)) {
    fill(0, 255, 0);   // Green
  } else {
    fill(180);         // Gray
  }
  rect(btn2X, btnY, btnWidth, btnHeight);

  //draw third button (blue button)
  if (isMouseOver(btn3X, btnY, btnWidth, btnHeight)) {
    fill(0, 0, 255);   // Blue
  } else {
    fill(180);         // Gray
  }
  rect(btn3X, btnY, btnWidth, btnHeight);
}

//cursos checker if its in rectangle or not
boolean isMouseOver(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w &&
         mouseY > y && mouseY < y + h;
}
