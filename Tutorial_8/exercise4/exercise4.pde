float angle = 0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
 background(0);
 lights();
 
 translate(width/2, height/2, 0);
 
 //Earth
 pushMatrix();
 fill(0, 0, 255); // blue
 noStroke();
 sphere(80);
 popMatrix();
 
 //Moon orbiting the earth
 pushMatrix();
 rotateY(angle); //orbiting movement
 translate(200, 0, 0);
 fill(150); //grey color
 sphere(30);
 popMatrix();
 
 angle += 0.02;
}
