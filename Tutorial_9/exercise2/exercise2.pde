//draw 20 random spheres and boxes with random attributes

int totalShapes = 20;

float[] x = new float[totalShapes];
float[] y = new float[totalShapes];
float[] z = new float[totalShapes];

float[] size = new float[totalShapes];

int[] shapeType = new int[totalShapes];     // 0 for sphere, 1 for box
int[] colourType = new int[totalShapes];    // 0 for red, 1 for green, 2 for blue

boolean[] useFill = new boolean[totalShapes];
boolean[] useStroke = new boolean[totalShapes];

void setup() {
  size(800, 600, P3D);

  //generate random properties once
  for (int i = 0; i < totalShapes; i++) {
    x[i] = random(-250, 250);
    y[i] = random(-180, 180);
    z[i] = random(-250, 250);

    size[i] = random(30, 90);

    shapeType[i] = int(random(2));   // sphere or box
    colourType[i] = int(random(3));  // red, green, or blue

    useFill[i] = random(1) > 0.5;
    useStroke[i] = random(1) > 0.5;
  }
}

void draw() {
  background(20);
  lights();

  //move origin to center of screen
  translate(width / 2, height / 2, 0);

  //rotate scene with mouse
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));

  for (int i = 0; i < totalShapes; i++) {
    pushMatrix();

    //move each shape to its own position
    translate(x[i], y[i], z[i]);

    //choose color
    if (colourType[i] == 0) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
    } else if (colourType[i] == 1) {
      fill(0, 255, 0);
      stroke(0, 255, 0);
    } else {
      fill(0, 0, 255);
      stroke(0, 0, 255);
    }

    //apply fill or noFill
    if (useFill[i]) {
      //keep current fill colour
    } else {
      noFill();
    }

    //apply outline or no outline
    if (useStroke[i]) {
      strokeWeight(2);
    } else {
      noStroke();
    }

    //draw either sphere or box
    if (shapeType[i] == 0) {
      sphere(size[i] / 2);
    } else {
      box(size[i]);
    }

    popMatrix();
  }
}
