import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid sun, earth, moon, stars;

PImage sunImg, earthImg, moonImg, starsImg;

float earthAngle = 0;
float moonAngle = 0;

float sunEarthDistance = 280;
float earthMoonDistance = 90;

void setup() {
  size(1000, 800, P3D);

  //load texture images from data folder
  sunImg = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg = loadImage("moon.jpg");
  starsImg = loadImage("stars.jpg");

  //create Sun
  sun = new Ellipsoid(100, 60, 60);
  sun.texture(sunImg);
  sun.drawMode(Shape3D.TEXTURE);
  sun.moveTo(0, 0, 0);

  //create Earth
  earth = new Ellipsoid(40, 50, 50);
  earth.texture(earthImg);
  earth.drawMode(Shape3D.TEXTURE);

  //create Moon
  moon = new Ellipsoid(15, 40, 40);
  moon.texture(moonImg);
  moon.drawMode(Shape3D.TEXTURE);

  //create large star background sphere
  stars = new Ellipsoid(2000, 60, 60);
  stars.texture(starsImg);
  stars.drawMode(Shape3D.TEXTURE);
  stars.moveTo(0, 0, 0);
}

void draw() {
  background(0);
  lights();

  //move the whole scene to center
  translate(width / 2, height / 2, 0);

  //rotate view slightly so orbit can be seen in 3D
  rotateX(-0.4);

  //allow mouse to rotate the scene
  rotateY(map(mouseX, 0, width, -PI, PI));

  //update orbit angles
  earthAngle += 0.01;
  moonAngle += 0.04;

  //calculate Earth position around the Sun
  float earthX = cos(earthAngle) * sunEarthDistance;
  float earthZ = sin(earthAngle) * sunEarthDistance;

  //calculate Moon position around the Earth
  float moonX = earthX + cos(moonAngle) * earthMoonDistance;
  float moonZ = earthZ + sin(moonAngle) * earthMoonDistance;

  //move Earth and Moon to their orbit positions
  earth.moveTo(earthX, 0, earthZ);
  moon.moveTo(moonX, 0, moonZ);

  //rotate objects
  sun.rotateBy(0, radians(1), 0);
  earth.rotateBy(0, radians(2), 0);
  moon.rotateBy(0, radians(3), 0);

  //slowly rotate star background
  stars.rotateBy(0, radians(0.05), 0);

  //draw stars first so it stays behind everything
  stars.draw(g);

  //draw orbit paths
  drawOrbit(sunEarthDistance);

  pushMatrix();
  translate(earthX, 0, earthZ);
  drawOrbit(earthMoonDistance);
  popMatrix();

  //draw planets
  sun.draw(g);
  earth.draw(g);
  moon.draw(g);
}

void drawOrbit(float radius) {
  noFill();
  stroke(120);
  strokeWeight(1);

  pushMatrix();
  rotateX(HALF_PI);
  ellipse(0, 0, radius * 2, radius * 2);
  popMatrix();
}
