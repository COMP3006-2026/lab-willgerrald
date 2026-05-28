PImage img;

void setup() {
  size(1000, 700);

  img = loadImage("photo.jpg");
  img.resize(width, height);

  //manipulate image pixels
  applyRedTint(img);
  replaceLastQuarterWithFirstQuarter(img);
}

void draw() {
  background(30);
  image(img, 0, 0);

  fill(255);
  textSize(16);
  text("Red tint applied. Last quarter replaced by first quarter.", 20, 30);
}

//apply red tint using pixels[]
void applyRedTint(PImage img) {
  img.loadPixels();

  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];

    float r = red(c);
    float g = green(c) * 0.5;
    float b = blue(c) * 0.5;

    img.pixels[i] = color(r, g, b);
  }

  img.updatePixels();
}

//replace last quarter with first quarter using pixels[]
void replaceLastQuarterWithFirstQuarter(PImage img) {
  img.loadPixels();

  int quarterWidth = img.width / 4;

  //make a copy of the first quarter first
  color[] firstQuarter = new color[quarterWidth * img.height];

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < quarterWidth; x++) {
      int sourceIndex = y * img.width + x;
      int tempIndex = y * quarterWidth + x;
      firstQuarter[tempIndex] = img.pixels[sourceIndex];
    }
  }

  //paste first quarter into last quarter
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < quarterWidth; x++) {
      int destX = img.width - quarterWidth + x;
      int destIndex = y * img.width + destX;
      int tempIndex = y * quarterWidth + x;

      img.pixels[destIndex] = firstQuarter[tempIndex];
    }
  }

  img.updatePixels();
}
