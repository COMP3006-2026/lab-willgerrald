int cellSize = 20;
int cols = 20;
int rows = 20;

void setup() {
  size(400, 400);
  noLoop();   //stop continuous redraw
}

void draw() {
  background(255);

  int i = 0;
  while (i < cols) {
    
    int j = 0;
    while (j < rows) {
      float gray = random(0, 255);
      fill(gray);
      noStroke();
      rect(i * cellSize, j * cellSize, cellSize, cellSize); 
      j++;
    }
    i++;
  }
}
