void setup() {
  size(600, 400);
  smooth();
  background(245);
  noLoop();

  drawPC(300, 220, 260, 180);
}

void drawPC(float x, float y, float w, float h) {
  //(x,y) = center of the setup

  float monW = w;
  float monH = h * 0.60;

  float standW = w * 0.18;
  float standH = h * 0.20;

  float baseW  = w * 0.40;
  float baseH  = h * 0.06;

  float keyW   = w * 0.75;
  float keyH   = h * 0.18;

  //MONITOR
  float left   = x - monW/2;
  float right  = x + monW/2;
  float top    = y - monH/2;
  float bottom = y + monH/2;

  fill(30);
  stroke(0);
  strokeWeight(2);

  beginShape();
  vertex(left, top);
  vertex(right, top);
  vertex(right, bottom);
  vertex(left, bottom);
  endShape(CLOSE);

  //screen inner bezel
  fill(80, 160, 255);
  noStroke();
  rectMode(CENTER);
  rect(x, y, monW * 0.88, monH * 0.78);

  //STAND NECK
  float neckTopY = bottom;
  float neckBotY = bottom + standH;
  float neckLeft = x - standW/2;
  float neckRight = x + standW/2;

  stroke(0);
  strokeWeight(2);
  fill(60);

  beginShape();
  vertex(neckLeft, neckTopY);
  vertex(neckRight, neckTopY);
  vertex(neckRight, neckBotY);
  vertex(neckLeft, neckBotY);
  endShape(CLOSE);

  //BASE (beginShape)
  float baseTopY = neckBotY;
  float baseBotY = baseTopY + baseH;
  float baseLeft = x - baseW/2;
  float baseRight = x + baseW/2;

  fill(70);
  beginShape();
  vertex(baseLeft, baseTopY);
  vertex(baseRight, baseTopY);
  vertex(baseRight - baseW*0.10, baseBotY);
  vertex(baseLeft + baseW*0.10, baseBotY);
  endShape(CLOSE);

  //KEYBOARD
  float keyTopY = baseBotY + h*0.12;
  float keyBotY = keyTopY + keyH;
  float keyLeft = x - keyW/2;
  float keyRight = x + keyW/2;

  fill(220);
  stroke(0);
  strokeWeight(2);

  // slightly trapezoid keyboard
  beginShape();
  vertex(keyLeft + keyW*0.08, keyTopY);
  vertex(keyRight - keyW*0.08, keyTopY);
  vertex(keyRight, keyBotY);
  vertex(keyLeft, keyBotY);
  endShape(CLOSE);
}
