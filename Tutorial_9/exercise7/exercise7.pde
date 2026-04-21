import peasy.*;

PeasyCam cam;

PImage brickTex;
PImage woodTex;
PImage darkWoodTex;
PImage floorTex;

void setup() {
  size(1000, 800, P3D);

  cam = new PeasyCam(this, 700);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(2000);

  //create simple procedural textures
  brickTex = createBrickTexture(300, 200);
  woodTex = createWoodTexture(300, 200);
  darkWoodTex = createDarkWoodTexture(300, 200);
  floorTex = createFloorTexture(300, 200);
}

void draw() {
  background(120);

  ambientLight(180, 180, 180);
  directionalLight(255, 255, 255, -1, -1, -1);
  pointLight(255, 255, 255, 0, -300, 300);

  //move whole room slightly down
  translate(0, 100, 0);

  //draw room
  drawRoom();

  //draw table and chair inside the room
  drawTable();
  drawChair();
}

void drawRoom() {
  //floor
  pushMatrix();
  translate(0, 120, 0);
  drawTexturedBox(600, 20, 600, floorTex);
  popMatrix();

  //back wall
  pushMatrix();
  translate(0, -80, -300);
  drawTexturedBox(600, 400, 20, brickTex);
  popMatrix();

  //front wall
  pushMatrix();
  translate(0, -80, 300);
  drawTexturedBox(600, 400, 20, brickTex);
  popMatrix();

  //left wall
  pushMatrix();
  translate(-300, -80, 0);
  drawTexturedBox(20, 400, 600, brickTex);
  popMatrix();

  //right wall
  pushMatrix();
  translate(300, -80, 0);
  drawTexturedBox(20, 400, 600, brickTex);
  popMatrix();
}

void drawTable() {
  //table top
  pushMatrix();
  translate(0, 30, 0);
  drawTexturedBox(220, 25, 130, woodTex);
  popMatrix();

  //table legs
  float legX = 85;
  float legZ = 45;

  pushMatrix();
  translate(-legX, 90, -legZ);
  drawTexturedBox(20, 110, 20, woodTex);
  popMatrix();

  pushMatrix();
  translate(legX, 90, -legZ);
  drawTexturedBox(20, 110, 20, woodTex);
  popMatrix();

  pushMatrix();
  translate(-legX, 90, legZ);
  drawTexturedBox(20, 110, 20, woodTex);
  popMatrix();

  pushMatrix();
  translate(legX, 90, legZ);
  drawTexturedBox(20, 110, 20, woodTex);
  popMatrix();
}

void drawChair() {
  //move chair beside the table
  pushMatrix();
  translate(0, 0, 180);

  //seat
  pushMatrix();
  translate(0, 65, 0);
  drawTexturedBox(100, 20, 100, darkWoodTex);
  popMatrix();

  //back rest
  pushMatrix();
  translate(0, 5, 45);
  drawTexturedBox(100, 120, 20, darkWoodTex);
  popMatrix();

  //chair legs
  pushMatrix();
  translate(-35, 105, -35);
  drawTexturedBox(15, 80, 15, darkWoodTex);
  popMatrix();

  pushMatrix();
  translate(35, 105, -35);
  drawTexturedBox(15, 80, 15, darkWoodTex);
  popMatrix();

  pushMatrix();
  translate(-35, 105, 35);
  drawTexturedBox(15, 80, 15, darkWoodTex);
  popMatrix();

  pushMatrix();
  translate(35, 105, 35);
  drawTexturedBox(15, 80, 15, darkWoodTex);
  popMatrix();

  popMatrix();
}

//custom textured box using QUADS
void drawTexturedBox(float w, float h, float d, PImage tex) {
  float x = w / 2;
  float y = h / 2;
  float z = d / 2;

  noStroke();

  beginShape(QUADS);
  texture(tex);

  //front
  vertex(-x, -y, z, 0, 0);
  vertex(x, -y, z, tex.width, 0);
  vertex(x, y, z, tex.width, tex.height);
  vertex(-x, y, z, 0, tex.height);

  //back
  vertex(x, -y, -z, 0, 0);
  vertex(-x, -y, -z, tex.width, 0);
  vertex(-x, y, -z, tex.width, tex.height);
  vertex(x, y, -z, 0, tex.height);

  //left
  vertex(-x, -y, -z, 0, 0);
  vertex(-x, -y, z, tex.width, 0);
  vertex(-x, y, z, tex.width, tex.height);
  vertex(-x, y, -z, 0, tex.height);

  //right
  vertex(x, -y, z, 0, 0);
  vertex(x, -y, -z, tex.width, 0);
  vertex(x, y, -z, tex.width, tex.height);
  vertex(x, y, z, 0, tex.height);

  //top
  vertex(-x, -y, -z, 0, 0);
  vertex(x, -y, -z, tex.width, 0);
  vertex(x, -y, z, tex.width, tex.height);
  vertex(-x, -y, z, 0, tex.height);

  //bottom
  vertex(-x, y, z, 0, 0);
  vertex(x, y, z, tex.width, 0);
  vertex(x, y, -z, tex.width, tex.height);
  vertex(-x, y, -z, 0, tex.height);

  endShape();
}

PImage createBrickTexture(int w, int h) {
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.background(150, 55, 45);
  pg.stroke(70, 30, 25);
  pg.strokeWeight(3);

  int brickW = 60;
  int brickH = 30;

  for (int y = 0; y < h; y += brickH) {
    int offset = (y / brickH) % 2 == 0 ? 0 : brickW / 2;

    for (int x = -offset; x < w; x += brickW) {
      pg.noFill();
      pg.rect(x, y, brickW, brickH);
    }
  }

  pg.endDraw();
  return pg.get();
}

PImage createWoodTexture(int w, int h) {
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.background(130, 80, 35);

  for (int y = 0; y < h; y += 8) {
    pg.stroke(90 + random(30), 55, 25);
    pg.line(0, y, w, y + random(-4, 4));
  }

  pg.endDraw();
  return pg.get();
}

PImage createDarkWoodTexture(int w, int h) {
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.background(80, 45, 25);

  for (int y = 0; y < h; y += 8) {
    pg.stroke(50 + random(30), 30, 15);
    pg.line(0, y, w, y + random(-4, 4));
  }

  pg.endDraw();
  return pg.get();
}

PImage createFloorTexture(int w, int h) {
  PGraphics pg = createGraphics(w, h);
  pg.beginDraw();
  pg.background(110, 90, 70);
  pg.stroke(70, 55, 40);
  pg.strokeWeight(2);

  for (int x = 0; x < w; x += 50) {
    pg.line(x, 0, x, h);
  }

  for (int y = 0; y < h; y += 50) {
    pg.line(0, y, w, y);
  }

  pg.endDraw();
  return pg.get();
}
