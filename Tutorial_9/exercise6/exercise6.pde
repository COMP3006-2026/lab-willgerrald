import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

PeasyCam cam;

Ellipsoid sun, earth, moon, stars;

PImage sunImg, earthImg, moonImg, starsImg;

float earthAngle = 0;
float moonAngle = 0;

float sunEarthDistance = 280;
float earthMoonDistance = 90;

void setup() {
  size(1000, 800, P3D);
  
  //create mouse driven camera
  cam = new PeasyCam(this, 700);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(2000);
  
  //load textures
  sunImg = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg = loadImage("moon.jpg");
  starsImg = loadImage("stars.jpg");
  
  //create sun
  sun = new Ellipsoid(100, 60, 60);
  sun.texture(sunImg);
  sun.drawMode(Shape3D.TEXTURE);
  sun.moveTo(0,0,0);
  
  //create earth
  earth = new Ellipsoid(40, 50, 50);
  earth.texture(earthImg);
  earth.drawMode(Shape3D.TEXTURE);
  
  //create moon
  moon = new Ellipsoid(15, 40, 40);
  moon.texture(moonImg);
  moon.drawMode(Shape3D.TEXTURE);
  
  //create stars background
  stars = new Ellipsoid(2000, 60, 60);
  stars.texture(starsImg);
  stars.drawMode(Shape3D.TEXTURE);
  stars.moveTo(0,0,0);
}

void draw() {
  background(0);
  
  //lighting
  ambientLight(80,80,80);
  directionalLight(255, 255, 255, -1, 0, -1);
  
  //update orbit angles
  earthAngle += 0.01;
  moonAngle += 0.04;
  
  //calculate earth position around sun
  float earthX = cos(earthAngle) * sunEarthDistance;
  float earthZ = sin(earthAngle) * sunEarthDistance;

  // calculate Moon position around Earth
  float moonX = earthX + cos(moonAngle) * earthMoonDistance;
  float moonZ = earthZ + sin(moonAngle) * earthMoonDistance;

  //update Earth and Moon position
  earth.moveTo(earthX, 0, earthZ);
  moon.moveTo(moonX, 0, moonZ);

  //rotate objects by themselves
  sun.rotateBy(0, radians(1), 0);
  earth.rotateBy(0, radians(2), 0);
  moon.rotateBy(0, radians(3), 0);

  //slowly rotate star background
  stars.rotateBy(0, radians(0.05), 0);

  //draw stars first
  stars.draw(g);

  //draw orbit path for Earth
  drawOrbit(0, 0, 0, sunEarthDistance);

  //draw orbit path for Moon around Earth
  drawOrbit(earthX, 0, earthZ, earthMoonDistance);

  //draw Sun, Earth and Moon
  sun.draw(g);
  earth.draw(g);
  moon.draw(g);
}

void drawOrbit(float cx, float cy, float cz, float radius) {
  pushMatrix();

  translate(cx, cy, cz);

  noFill();
  stroke(120);
  strokeWeight(1);

  // rotate circle so it lies on the X-Z plane
  rotateX(HALF_PI);
  ellipse(0, 0, radius * 2, radius * 2);

  popMatrix();
}
