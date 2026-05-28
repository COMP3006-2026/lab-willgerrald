Table data;

int weekdayRow = 4;
int saturdayRow = 8;
int sundayRow = 12;

String[] quarters = {
  "Dec-08", "Mar-09", "Jun-09", "Sep-09",
  "Dec-09", "Mar-10", "Jun-10", "Sep-10", "Dec-10"
};

float scale = 0.08;

void setup() {
  size(1200, 700);
  textAlign(CENTER, CENTER);
  textSize(14);

  data = loadTable("T4q8.csv", "csv");

  if (data == null) {
    println("ERROR: T4q8.csv not found.");
    println("Put T4q8.csv inside the sketch folder -> data folder.");
    exit();
  }

  noLoop();
}

void draw() {
  background(255);

  fill(0);
  textSize(20);
  text("Traffic Subtotals Visualization", width/2, 40);

  float startX = 140;
  float gapX = 110;

  // labels on left
  fill(0);
  textSize(16);
  text("Weekday", 70, 220);
  text("Saturday", 70, 390);
  text("Sunday", 70, 560);

  for (int c = 1; c <= 9; c++) {
    float weekday = getSafeFloat(weekdayRow, c);
    float saturday = getSafeFloat(saturdayRow, c);
    float sunday = getSafeFloat(sundayRow, c);

    float x = startX + (c - 1) * gapX;

    drawCircle(x, 220, weekday, color(50, 120, 255));
    drawCircle(x, 390, saturday, color(255, 120, 50));
    drawCircle(x, 560, sunday, color(50, 200, 120));

    fill(0);
    textSize(12);
    text(quarters[c - 1], x, 650);
  }
}

void drawCircle(float x, float y, float value, int c) {
  float radius = sqrt(value) * scale;

  fill(c, 180);
  noStroke();
  ellipse(x, y, radius * 2, radius * 2);

  fill(0);
  textSize(10);
  text(nfc(value, 0), x, y);
}

float getSafeFloat(int row, int col) {
  String s = data.getString(row, col);

  if (s == null || s.equals("")) {
    return 0;
  }

  return float(trim(s));
}
