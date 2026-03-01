void setup() {
  size(600, 300);
  noLoop();
}

void draw() {
  background(0);
  noiseSeed(777);
  noiseDetail(6, 0.5);
  float scale = 0.02;    //noise scale
  float warp = 80.0;     //how strong the distortion is
  float freq = 0.08;     //stripe frequency
  loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // noise-based displacement
      float n = noise(x * scale, y * scale);
      float offset = (n - 0.5) * warp;
      
      //stripe pattern, warped by noise
      float v = sin((x + offset) * freq);

      // map to grayscale
      int c = int(map(v, -1, 1, 30, 255));
      pixels[y * width + x] = color(c);
    }
  }
  updatePixels();
}
