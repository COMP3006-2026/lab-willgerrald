import shapes3d.utils.*;
import shapes3d.*;

void setup() {
  size(1000, 700, P3D);
}

void draw() {
  background(30);
  lights();

  translate(width / 2, height / 2, 0);

  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI / 4, PI / 4));

  //draw 5 cars with different positions, sizes, and colours
  drawCar(-300, 0, 0, 0.7, color(220, 40, 40), color(40, 120, 220));
  drawCar(-150, 120, -80, 0.9, color(40, 200, 80), color(200, 200, 255));
  drawCar(0, -50, 60, 1.0, color(255, 180, 0), color(80, 80, 200));
  drawCar(180, 80, -120, 1.2, color(180, 0, 200), color(180, 180, 255));
  drawCar(320, -100, 100, 0.6, color(0, 180, 220), color(255, 255, 255));
}

void drawCar(float x, float y, float z, float scaleFactor, color bodyColor, color cabinColor) {
  pushMatrix();
  translate(x, y, z);
  scale(scaleFactor);

  //car body
  pushMatrix();
  fill(bodyColor);
  noStroke();
  translate(0, 0, 0);
  box(260, 70, 100);
  popMatrix();

  //car cabin
  pushMatrix();
  fill(cabinColor);
  translate(-20, -65, 0);
  box(120, 60, 80);
  popMatrix();

  //wheels
  drawWheel(-90, 45, -55);
  drawWheel(90, 45, -55);
  drawWheel(-90, 45, 55);
  drawWheel(90, 45, 55);

  //front lights
  drawLight(-130, 10, -25, color(255, 255, 0));
  drawLight(-130, 10, 25, color(255, 255, 0));

  popMatrix();
}

void drawWheel(float x, float y, float z) {
  Ellipsoid wheel = new Ellipsoid(20, 20, 20);
  wheel.moveTo(x, y, z);
  wheel.fill(color(20));
  wheel.draw(g);
}

void drawLight(float x, float y, float z, color c) {
  Ellipsoid light = new Ellipsoid(10, 10, 10);
  light.moveTo(x, y, z);
  light.fill(c);
  light.draw(g);
}
