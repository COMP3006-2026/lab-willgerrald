void setup() {
  size(600, 500);
  smooth();
  noLoop();
}

void draw() {
  background(255);

  float xMin = -2;
  float xMax =  2;
  float yMin = -6;
  float yMax =  5;

  //draw grid
  stroke(220);
  for (int i = -5; i <= 5; i++) {
    float sx = map(i, xMin, xMax, 0, width);
    float sy = map(i, yMin, yMax, height, 0);

    line(sx, 0, sx, height);   // vertical grid
    line(0, sy, width, sy);    // horizontal grid
  }

  //draw axes
  stroke(0);
  float xAxisY = map(0, yMin, yMax, height, 0);
  float yAxisX = map(0, xMin, xMax, 0, width);

  line(0, xAxisY, width, xAxisY);
  line(yAxisX, 0, yAxisX, height);

  //draw curve using line segments
  stroke(0, 120, 255);
  strokeWeight(2);

  float step = 0.01;
  float prevX = xMin;
  float prevY = 1 - pow(prevX, 4);

  for (float x = xMin + step; x <= xMax; x += step) {
    float y = 1 - pow(x, 4);
    
    float sx1 = map(prevX, xMin, xMax, 0, width);
    float sy1 = map(prevY, yMin, yMax, height, 0);
    
    float sx2 = map(x, xMin, xMax, 0, width);
    float sy2 = map(y, yMin, yMax, height, 0);

    line(sx1, sy1, sx2, sy2);

    prevX = x;
    prevY = y;
  }
}
