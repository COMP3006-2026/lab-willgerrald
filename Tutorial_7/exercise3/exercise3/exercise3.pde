PImage[] earth= new PImage[240];
PImage moon;
int frame = 0;
float angle = 0;
float dmoontoearth = 180;
float angularspeed = 0.025;

// shuttle movement
float t = 0.0;              // 0 -> 1
float tripSpeed = 0.0035;   // controls total travel speed
boolean arrived = false;

void setup() {
  size(500, 500);
  for (int i=0; i<240; i++) {
    earth[i] = loadImage("../earth/" + i + ".gif");
  }
  moon = loadImage("../moon.png");
  moon.resize (50,50);
  frameRate(15);
  imageMode(CENTER);
}

void draw() {
  background(0);

  float earthX = 250;
  float earthY = 250;

  // moon orbit from previous task
  float moonx = sin(angle) * dmoontoearth + 250;
  float moony = cos(angle) * dmoontoearth + 250;

  // draw Earth and Moon
  image(earth[frame % 240], earthX, earthY);
  image(moon, moonx, moony);

  //update shuttle travel only if not arrived
  if (!arrived) {
    t += tripSpeed;
    if (t >= 1.0) {
      t = 1.0;
      arrived = true;
    }
  }

  //ease-in-out:
  //accelerates from Earth, fastest at middle, slows near Moon
  float easedT = 3 * t * t - 2 * t * t * t;

  //starting point = just outside Earth
  float startX = earthX + 55;
  float startY = earthY;

  //ending point = just before Moon
  float endX = moonx - 35;
  float endY = moony;

  //straight-line interpolation
  float shuttleX = lerp(startX, endX, easedT);
  float shuttleY = lerp(startY, endY, easedT);

  //angle so shuttle points toward moon
  float shuttleAngle = atan2(endY - startY, endX - startX);

  drawShuttle(shuttleX, shuttleY, shuttleAngle);

  angle += angularspeed;
  frame++;
}
void drawShuttle(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);

  stroke(255);
  strokeWeight(1);
  fill(220);

  // body polygon
  beginShape();
  vertex(-18, -8);
  vertex(8, -8);
  vertex(20, 0);
  vertex(8, 8);
  vertex(-18, 8);
  vertex(-10, 0);
  endShape(CLOSE);

  // top wing
  fill(180);
  triangle(-8, -8, -2, -18, 4, -8);

  // bottom wing
  triangle(-8, 8, -2, 18, 4, 8);

  // window
  fill(100, 180, 255);
  ellipse(8, 0, 6, 6);

  popMatrix();
}
