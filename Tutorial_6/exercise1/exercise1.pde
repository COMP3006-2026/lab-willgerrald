PImage img1, img2;

void setup() {
  size(1000, 700);
  
  img1 = loadImage("multiverse-of-rick-and-morty.jpg");
  img2 = loadImage("shiva wallpaper.jpg");
  
  img1.resize(width, height);
  img2.resize(width, height);
}

void draw() {
  background(0);

  //show first image as base
  image(img1, 0, 0);

  //size of copied area depends on mouse position
  int w = constrain(mouseX / 2, 50, width);
  int h = constrain(mouseY / 2, 50, height);

  //center copied area around mouse
  int sx = constrain(mouseX - w / 2, 0, width - w);
  int sy = constrain(mouseY - h / 2, 0, height - h);

  //copy part of second image onto the screen
  copy(img2, sx, sy, w, h, sx, sy, w, h);

  //optional frame so the mixed area is visible
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  rect(sx, sy, w, h);

  fill(255);
  textSize(16);
  text("Move mouse to reveal a mixture of the two images", 20, 30);
}
