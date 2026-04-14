float shuttleX = -200;
float shuttleSpeed = 1.5;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(20);
  lights();
  
  translate(width/2, height/2, 0);
  rotateX(-0.3); //more 3D preview
  
  //Earth
  pushMatrix();
  noStroke();
  fill(0, 100, 255);
  translate(-200, 0, 0);
  sphere(80);
  popMatrix();
  
  //Moon
  pushMatrix();
  noStroke();
  fill(160);
  translate(200, 0, 0);
  sphere(30);
  popMatrix();
  
  //Shuttle flying from eath to moon
  pushMatrix();
  fill(255);
  translate(shuttleX, 0, 0); //shuttle moves along x-axis
  box(40, 20, 20);
  popMatrix();
  
  //move shuttle toward the moon
  if(shuttleX < 200) {
    shuttleX += shuttleSpeed;
  }
}
