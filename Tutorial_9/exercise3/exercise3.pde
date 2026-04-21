import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid wheel1, wheel2, wheel3, wheel4;
Ellipsoid light1, light2;

void setup() {
  size(800, 600, P3D);

  wheel1 = new Ellipsoid(20, 20, 20);
  wheel1.moveTo(-90, 45, -55);
  wheel1.fill(color(20));

  wheel2 = new Ellipsoid(20, 20, 20);
  wheel2.moveTo(90, 45, -55);
  wheel2.fill(color(20));

  wheel3 = new Ellipsoid(20, 20, 20);
  wheel3.moveTo(-90, 45, 55);
  wheel3.fill(color(20));

  wheel4 = new Ellipsoid(20, 20, 20);
  wheel4.moveTo(90, 45, 55);
  wheel4.fill(color(20));

  light1 = new Ellipsoid(10, 10, 10);
  light1.moveTo(-130, 10, -25);
  light1.fill(color(255, 255, 0));

  light2 = new Ellipsoid(10, 10, 10);
  light2.moveTo(-130, 10, 25);
  light2.fill(color(255, 255, 0));
}

void draw() {
  background(30);
  lights();

  translate(width / 2, height / 2, 0);

  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI / 4, PI / 4));

  //car body using Processing primitive box
  pushMatrix();
  fill(220, 40, 40);
  noStroke();
  translate(0, 0, 0);
  box(260, 70, 100);
  popMatrix();

  //car cabin using Processing primitive box
  pushMatrix();
  fill(40, 120, 220);
  translate(-20, -65, 0);
  box(120, 60, 80);
  popMatrix();

  //draw Shape3D wheels and lights
  wheel1.draw(g);
  wheel2.draw(g);
  wheel3.draw(g);
  wheel4.draw(g);

  light1.draw(g);
  light2.draw(g);
}
