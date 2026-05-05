String[] lines;

void setup() {
  size(400, 300);
  background(255);
  stroke(0);
  noFill();

  lines = loadStrings("data.txt");

  for (int i = 0; i < lines.length; i++) {
    drawShape(lines[i]);
  }
}

void draw() {
}

void drawShape(String lineData) {
  String[] parts = split(lineData, ' ');
  String shapeType = parts[0];
  String[] values = split(parts[1], ',');

  if (shapeType.equals("ellipse")) {
    float x = float(values[0]);
    float y = float(values[1]);
    float w = float(values[2]);
    float h = float(values[3]);
    ellipse(x, y, w, h);
  } 
  else if (shapeType.equals("line")) {
    float x1 = float(values[0]);
    float y1 = float(values[1]);
    float x2 = float(values[2]);
    float y2 = float(values[3]);
    line(x1, y1, x2, y2);
  } 
  else if (shapeType.equals("rect")) {
    float x = float(values[0]);
    float y = float(values[1]);
    float w = float(values[2]);
    float h = float(values[3]);
    rect(x, y, w, h);
  }
}
