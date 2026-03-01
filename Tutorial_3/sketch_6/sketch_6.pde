void setup() {
  size(600, 600);
  smooth();
  noLoop();
}
void draw() {
  background(255);

  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    float radius = random(10, 80);   //different sizes
    float gray = random(0, 255);     //gray color
    fill(gray);
    noStroke();
    ellipse(x, y, radius, radius);
  }
}
