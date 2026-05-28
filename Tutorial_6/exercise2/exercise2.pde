PImage originalImg;
PImage rotatedImg;

int imgX, imgY; //top-left position of rotated image on screen

void setup() {
  size(1000, 800);
  
  originalImg = loadImage("photo.jpg");
  rotatedImg = rotateImage90(originalImg);
  
  //center rotated image on screen
  imgX = (width - rotatedImg.width) /2;
  imgY = (height - rotatedImg.height)/2;
}

void draw() {
  background(30);
  
  //make a copy each fram so highlight resets correctly
  PImage displayImg = rotatedImg.copy();
  
  //check if mouse is over the rotated image
  if (mouseX >= imgX && mouseX < imgX + rotatedImg.width && mouseY >=
      imgY && mouseY < imgY + rotatedImg.height) {
        
    int localX = mouseX - imgX;
    int localY = mouseY - imgY;
    
    highlightRegion(displayImg, localX, localY, 50, 50);
    }
    
  image(displayImg, imgX, imgY);
  
  fill(255);
  textSize(16);
  text("Rotated 90 degrees. Move mouse over image to brighten a 50x50 region.", 20, 30);
} 
  //rotate image 90 degrees clockwise
PImage rotateImage90(PImage img) {
  PImage result = createImage(img.height, img.width, RGB);

  img.loadPixels();
  result.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int newX = img.height - 1 - y;
      int newY = x;

      result.pixels[newY * result.width + newX] = img.pixels[y * img.width + x];
    }
  }

  result.updatePixels();
  return result;
}

//brighten pixels inside the focus region
void highlightRegion(PImage img, int centerX, int centerY, int regionW, int regionH) {
  img.loadPixels();

  int startX = max(0, centerX - regionW / 2);
  int startY = max(0, centerY - regionH / 2);
  int endX = min(img.width, centerX + regionW / 2);
  int endY = min(img.height, centerY + regionH / 2);

  for (int y = startY; y < endY; y++) {
    for (int x = startX; x < endX; x++) {
      int index = y * img.width + x;
      color c = img.pixels[index];

      float r = min(red(c) * 1.4, 255);
      float g = min(green(c) * 1.4, 255);
      float b = min(blue(c) * 1.4, 255);

      img.pixels[index] = color(r, g, b);
    }
  }

  img.updatePixels();
}
