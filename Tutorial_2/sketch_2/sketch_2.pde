int cellSize = 20;   //size of each small square
int cols = 20;       //number of columns
int rows = 20;       //number of rows

void setup() {
  size(400, 400);
  noLoop();   //draw once
}
void draw() {
  background(255);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float gray = random(0, 255);   //random gray value
      fill(gray);                    //same value for R,G,B
      noStroke();
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }
}
