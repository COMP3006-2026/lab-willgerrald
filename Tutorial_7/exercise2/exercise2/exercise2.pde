PImage[] earth= new PImage[240];
PImage moon;
int frame = 0;
float moonx = 0;
float moony = 0;
float angle = 0;
float dmoontoearth = 180;
float angularspeed = 0.025;

int trailLength = 12;
float[] trailX = new float[trailLength];
float[] trailY = new float[trailLength]; 

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
  moonx = sin(angle) * dmoontoearth + 250;
  moony = cos(angle) * dmoontoearth * 0.2 +250;
  
  for (int i = trailLength - 1; i>0; i--) {
    trailX[i] = trailX[i-1];
    trailY[i] = trailY[i-1];
  }
  
  trailX[0] = moonx;
  trailY[0] = moony;
  
  if (cos(angle)<0) {
    drawMoonTrail();
    //MOON
    image(moon, moonx, moony);
     //EARTH
    image(earth[frame%240], 250, 250);
  } else {
    //EARTH
    image(earth[frame%240], 250, 250);
    //MOON
    image(moon, moonx, moony);
  }
  
  angle += angularspeed;
  frame++;
}

void drawMoonTrail() {
  tint(255, 40);
  for (int i = trailLength - 1; i>= 1; i--) {
    int alpha = int(map(i, trailLength - 1, 1, 20, 120));
    tint(255, alpha);
    image(moon, trailX[i], trailY[i]);
  }
  tint(255, 255);
}
