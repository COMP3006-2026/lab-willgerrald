import shapes3d.utils.*;
import shapes3d.*;

void setup() {
  size(1100, 750, P3D);
  hint(ENABLE_DEPTH_SORT);   //helps transparency look better in P3D
}

void draw() {
  background(30);
  lights();

  translate(width / 2, height / 2, 0);

  //view control
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI / 5, PI / 5));

  float t = frameCount * 0.02;

  //Car 1: moves along a 3D curved path
  drawCar(
    -300 + 120 * cos(t),
    -120 + 60 * sin(t * 1.2),
    -120 + 100 * sin(t),
    0.8,
    color(220, 40, 40),
    color(40, 120, 220),
    255,
    0
  );

  //Car 2: moves + rotates while moving
  drawCar(
    -120 + 140 * cos(t * 0.9),
    80 + 40 * sin(t * 0.7),
    100 * cos(t * 1.1),
    1.0,
    color(40, 200, 80),
    color(220, 220, 255),
    255,
    t * 2.0
  );

  //Car 3: moves + increases its size to a maximum while moving
  float scaleCar3 = map(sin(t) + 1, 0, 2, 0.7, 1.5);   // grows to max 1.5
  drawCar(
    0 + 170 * sin(t * 0.8),
    -40 + 50 * cos(t * 0.6),
    -50 + 120 * cos(t * 0.8),
    scaleCar3,
    color(255, 180, 0),
    color(80, 80, 200),
    255,
    0
  );

  //Car 4: moves + fades out onto the background
  float alphaCar4 = map(sin(t) + 1, 0, 2, 40, 255);    // fade in/out
  drawCar(
    180 + 130 * cos(t * 1.1),
    100 + 30 * sin(t * 0.9),
    -140 + 100 * sin(t * 1.3),
    1.1,
    color(180, 0, 200),
    color(200, 180, 255),
    alphaCar4,
    0
  );

  //Car 5: another 3D path
  drawCar(
    320 + 100 * sin(t * 1.3),
    -100 + 70 * cos(t * 0.5),
    90 * sin(t * 0.9),
    0.65,
    color(0, 180, 220),
    color(255, 255, 255),
    255,
    0
  );
}

void drawCar(float x, float y, float z, float scaleFactor,
             color bodyColor, color cabinColor, float alphaValue, float rotateYAngle) {
  pushMatrix();
  translate(x, y, z);
  rotateY(rotateYAngle);
  scale(scaleFactor);

  //car body
  pushMatrix();
  fill(red(bodyColor), green(bodyColor), blue(bodyColor), alphaValue);
  noStroke();
  box(260, 70, 100);
  popMatrix();

  //car cabin
  pushMatrix();
  fill(red(cabinColor), green(cabinColor), blue(cabinColor), alphaValue);
  translate(-20, -65, 0);
  box(120, 60, 80);
  popMatrix();

  //wheels
  drawWheel(-90, 45, -55, alphaValue);
  drawWheel(90, 45, -55, alphaValue);
  drawWheel(-90, 45, 55, alphaValue);
  drawWheel(90, 45, 55, alphaValue);

  //lights
  drawLight(-130, 10, -25, color(255, 255, 0), alphaValue);
  drawLight(-130, 10, 25, color(255, 255, 0), alphaValue);

  popMatrix();
}

void drawWheel(float x, float y, float z, float alphaValue) {
  Ellipsoid wheel = new Ellipsoid(20, 20, 20);
  wheel.moveTo(x, y, z);
  wheel.fill(color(20, 20, 20, alphaValue));
  wheel.draw(g);
}

void drawLight(float x, float y, float z, color c, float alphaValue) {
  Ellipsoid light = new Ellipsoid(10, 10, 10);
  light.moveTo(x, y, z);
  light.fill(color(red(c), green(c), blue(c), alphaValue));
  light.draw(g);
}
