PImage img;
PImage copiedRegion = null;

//selection coordinates
int startX, startY;
int endX, endY;

boolean selecting = false;
boolean readyToPaste = false;

void setup() {
  size(1000, 700);
  img = loadImage("photo.jpg");
  img.resize(width, height);
}

void draw() {
  background(30);

  //always show the current image
  image(img, 0, 0);

  //draw selection rectangle while dragging
  if (selecting) {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);

    int x = min(startX, mouseX);
    int y = min(startY, mouseY);
    int w = abs(mouseX - startX);
    int h = abs(mouseY - startY);

    rect(x, y, w, h);
  }

  fill(255);
  textSize(16);

  if (!readyToPaste) {
    text("Drag mouse to select an area", 20, 30);
  } else {
    text("Selection copied. Click anywhere to paste it.", 20, 30);
  }
}

void mousePressed() {
  //if a copied region exists, paste it on the next click
  if (readyToPaste && copiedRegion != null) {
    img.copy(copiedRegion, 0, 0, copiedRegion.width, copiedRegion.height,
             mouseX, mouseY, copiedRegion.width, copiedRegion.height);

    readyToPaste = false;
    return;
  }

  //otherwise start selecting
  selecting = true;
  startX = mouseX;
  startY = mouseY;
}

void mouseDragged() {
  if (selecting) {
    endX = mouseX;
    endY = mouseY;
  }
}

void mouseReleased() {
  if (selecting) {
    selecting = false;

    int x = min(startX, endX);
    int y = min(startY, endY);
    int w = abs(endX - startX);
    int h = abs(endY - startY);

    //avoid empty selection
    if (w > 0 && h > 0) {
      copiedRegion = createImage(w, h, RGB);
      copiedRegion.copy(img, x, y, w, h, 0, 0, w, h);
      readyToPaste = true;
    }
  }
}
