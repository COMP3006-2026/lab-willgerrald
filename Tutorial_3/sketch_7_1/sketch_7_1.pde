void setup() {
  size(600, 300);
  noLoop();
}
void draw() {
  background(0);
  noiseSeed(12345);     //change seed for a different look
  noiseDetail(5, 0.55); //richer noise
  float scale = 0.015;  // zoom level
  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float n = noise(x * scale, y * scale);
      int c = int(n * 255);
      pixels[y * width + x] = color(c);
    }
  }
  updatePixels();
}
