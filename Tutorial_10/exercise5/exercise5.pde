import shapes3d.utils.*;
import shapes3d.*;

int totalCars = 5;

// car positions
float[] carX = {-300, -150, 0, 180, 320};
float[] carY = {0, 120, -50, 80, -100};
float[] carZ = {0, -80, 60, -120, 100};

// car sizes
float[] carScale = {0.7, 0.9, 1.0, 1.2, 0.6};

// original colours
color[] bodyColors = {
  color(220, 40, 40),
  color(40, 200, 80),
  color(255, 180, 0),
  color(180, 0, 200),
  color(0, 180, 220)
};

color[] cabinColors = {
  color(40, 120, 220),
  color(200, 200, 255),
  color(80, 80, 200),
  color(180, 180, 255),
  color(255, 255, 255)
};

int selectedCar = -1;

// offsets for dragging
float dragOffsetX = 0;
float dragOffsetY = 0;
float dragOffsetZ = 0;

void setup() {
  size(1000, 700, P3D);
}

void draw() {
  background(30);
  lights();

  translate(width / 2, height / 2, 0);

  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI / 4, PI / 4));

  for (int i = 0; i < totalCars; i++) {
    color currentBody = bodyColors[i];
    color currentCabin = cabinColors[i];

    // selected car becomes brighter
    if (i == selectedCar) {
      currentBody = brighterColor(bodyColors[i]);
      currentCabin = brighterColor(cabinColors[i]);
    }

    drawCar(carX[i], carY[i], carZ[i], carScale[i], currentBody, currentCabin);
  }
}

void mousePressed() {
  selectedCar = -1;
  float bestDist = 999999;

  for (int i = 0; i < totalCars; i++) {
    // simple picking in screen space
    float screenPX = width / 2 + carX[i];
    float screenPY = height / 2 + carY[i];

    float d = dist(mouseX, mouseY, screenPX, screenPY);
    float pickRadius = 80 * carScale[i];

    if (d < pickRadius && d < bestDist) {
      bestDist = d;
      selectedCar = i;
    }
  }

  // store offsets
  if (selectedCar != -1) {
    dragOffsetX = carX[selectedCar] - (mouseX - width / 2);
    dragOffsetY = carY[selectedCar] - (mouseY - height / 2);

    // use mouseY to control depth when SHIFT is pressed
    float currentMouseDepth = map(mouseY, 0, height, -300, 300);
    dragOffsetZ = carZ[selectedCar] - currentMouseDepth;
  }
}

void mouseDragged() {
  if (selectedCar != -1) {
    // normal drag = move in x and y
    if (!(keyPressed && keyCode == SHIFT)) {
      carX[selectedCar] = (mouseX - width / 2) + dragOffsetX;
      carY[selectedCar] = (mouseY - height / 2) + dragOffsetY;
    }
    // hold SHIFT = move in z (depth)
    else {
      carZ[selectedCar] = map(mouseY, 0, height, -300, 300) + dragOffsetZ;
    }
  }
}

void drawCar(float x, float y, float z, float scaleFactor, color bodyColor, color cabinColor) {
  pushMatrix();
  translate(x, y, z);
  scale(scaleFactor);

  // car body
  pushMatrix();
  fill(bodyColor);
  noStroke();
  box(260, 70, 100);
  popMatrix();

  // car cabin
  pushMatrix();
  fill(cabinColor);
  translate(-20, -65, 0);
  box(120, 60, 80);
  popMatrix();

  // wheels
  drawWheel(-90, 45, -55);
  drawWheel(90, 45, -55);
  drawWheel(-90, 45, 55);
  drawWheel(90, 45, 55);

  // lights
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

color brighterColor(color c) {
  float r = min(red(c) * 1.4, 255);
  float g2 = min(green(c) * 1.4, 255);
  float b = min(blue(c) * 1.4, 255);
  return color(r, g2, b);
}
