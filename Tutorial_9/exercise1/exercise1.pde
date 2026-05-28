//draw 20 random spheres and boxes in 3D
int totalShapes = 20;

float[] x = new float[totalShapes];
float[] y = new float[totalShapes];
float[] z = new float[totalShapes];
float[] size = new float[totalShapes];
int[] shapeType = new int[totalShapes]; //0 for sphere & 1 for box

void setup() {
  size(800, 600, P3D);

  //create random values once
  for (int i = 0; i < totalShapes; i++) {
    x[i] = random(-250, 250);
    y[i] = random(-180, 180);
    z[i] = random(-250, 250);
    size[i] = random(30, 90);
    shapeType[i] = int(random(2)); //randomly choose sphere or box
  }
}

void draw() {
  background(20);
  lights();

  //move origin to center of screen
  translate(width / 2, height / 2, 0);

  //rotate scene with mouse to view in 3D
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));

  noStroke();

  for (int i = 0; i < totalShapes; i++) {
    pushMatrix();

    //move each shape to its own random position
    translate(x[i], y[i], z[i]);

    //give each shape a different colour
    fill(100 + i * 12, 150, 220 - i * 10);

    //draw either sphere or box
    if (shapeType[i] == 0) {
      sphere(size[i] / 2);
    } else {
      box(size[i]);
    }

    popMatrix();
  }
}
