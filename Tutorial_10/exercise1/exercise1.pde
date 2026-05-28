float sphereX, sphereY, sphereZ;

void setup() {
  size(800, 600, P3D);
  sphereX = 0;
  sphereY = 0;
  sphereX = 0;
}

void draw() {
  background(30);
  lights();
  
  //move origin to center
  translate(width/2, height/2, 0);
  
  //normal mode: sphere follows mouse in X and Y
  if(!(keyPressed && keyCode == SHIFT)) {
    sphereX = mouseX - width/2;
    sphereY = mouseY - height/2;
  }
   
  //shift mode: move sphere in Z direction only
  else {
    sphereZ = map(mouseY, 0, height, -300, 300);
  }
  
  pushMatrix();
  translate(sphereX, sphereY, sphereZ);
  fill(100, 180, 255);
  noStroke();
  sphere(40);
  popMatrix();
}
