void setup() {
  size(600, 200);
  noLoop();
}

void draw() {
  background(200);

  float x0 = 60;         //left start
  float baseY = 160;     //bottom
  float ridgeY = 95;     //top ridge
  float peakY  = 25;     //spike tips

  int spikes = 10;
  float spikeW = 42;     //width of each spike
  float slopeW = 22;     //width of left/right slanted edges

  fill(0);
  noStroke();

  beginShape();

  //bottom-left
  vertex(x0, baseY);

  //left slant up to ridge
  vertex(x0 + slopeW, ridgeY);

  //start at first ridge point
  float startRidgeX = x0 + slopeW;

  //loop
  for (int i = 0; i < spikes; i++) {
    float leftX = startRidgeX + i * spikeW;

    //peak of spike
    vertex(leftX + spikeW * 0.5, peakY);

    //ridge between spikes
    vertex(leftX + spikeW, ridgeY);
  }

  //right slant down to bottom-right
  float endRidgeX = startRidgeX + spikes * spikeW;
  vertex(endRidgeX + slopeW, baseY);

  endShape(CLOSE);
}
