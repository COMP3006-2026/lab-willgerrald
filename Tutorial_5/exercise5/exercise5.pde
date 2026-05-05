float cx, cy;
float clockRadius = 180;

void setup() {
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
  smooth();
}

void draw() {
  background(255);

  // clock face
  stroke(0);
  strokeWeight(2);
  fill(245);
  ellipse(cx, cy, clockRadius * 2, clockRadius * 2);

  //hour marks
  for (int i = 0; i < 12; i++) {
    float angle = TWO_PI / 12 * i - HALF_PI;
    float x1 = cx + cos(angle) * (clockRadius - 15);
    float y1 = cy + sin(angle) * (clockRadius - 15);
    float x2 = cx + cos(angle) * clockRadius;
    float y2 = cy + sin(angle) * clockRadius;
    line(x1, y1, x2, y2);
  }

  //get current time
  int h = hour();
  int m = minute();
  int s = second();

  //convert time to angles
  float secondAngle = map(s, 0, 60, 0, TWO_PI) - HALF_PI;
  float minuteAngle = map(m + s / 60.0, 0, 60, 0, TWO_PI) - HALF_PI;
  float hourAngle = map((h % 12) + m / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;

  //second hand
  stroke(255, 0, 0);
  strokeWeight(1);
  float sx = cx + cos(secondAngle) * (clockRadius - 25);
  float sy = cy + sin(secondAngle) * (clockRadius - 25);
  line(cx, cy, sx, sy);

  //minute hand
  stroke(0);
  strokeWeight(3);
  float mx = cx + cos(minuteAngle) * (clockRadius - 40);
  float my = cy + sin(minuteAngle) * (clockRadius - 40);
  line(cx, cy, mx, my);

  //hour hand
  stroke(0);
  strokeWeight(5);
  float hx = cx + cos(hourAngle) * (clockRadius - 70);
  float hy = cy + sin(hourAngle) * (clockRadius - 70);
  line(cx, cy, hx, hy);

  //center point
  fill(0);
  noStroke();
  ellipse(cx, cy, 10, 10);
}
