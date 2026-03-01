void setup() {
   size(400,400);
   background(255);
   smooth();
   ellipseMode(CENTER);
   rectMode(CENTER);
   
  //Test draw 3 humans
  drawHuman(200, 220, 120, 220);
  drawHuman(90, 260, 70, 140);
  drawHuman(320, 260, 80, 160);
}

void drawHuman(float x, float y, float w, float h) {
   
  //Body
  float bodyW = w * 0.22;
  float bodyH = h * 0.50;
  float bodyX = x;
  float bodyY = y;
  
  stroke(0);
  fill(0,255,220);
  rect(bodyX, bodyY, bodyW, bodyH);
  
  //head
  float headD = w * 0.50; 
  float headX = x;
  float headY = y - bodyH * 0.55;
  
  fill(255);
  ellipse(headX, headY, headD, headD);
  
  //eyes
  float eyeW = headD * 0.13;
  float eyeH = headD * 0.27;
  float eyeOffsetX = headD * 0.32;
  
  fill(0);
  ellipse(headX - eyeOffsetX, headY, eyeW, eyeH);
  ellipse(headX + eyeOffsetX, headY, eyeW, eyeH);
  
  //eyebrows
  stroke(255, 0, 0);
  line(headX - eyeOffsetX - headD*0.05, headY - headD*0.33,
       headX - eyeOffsetX + headD*0.10, headY - headD*0.08);

  line(headX + eyeOffsetX + headD*0.05, headY - headD*0.33,
       headX + eyeOffsetX - headD*0.10, headY - headD*0.08);
  //nose
  fill(255,0,0);
  stroke(0);
  ellipse(headX, headY + headD*0.17, headD*0.17, headD*0.17);
  
  //mouth
  fill(0);
  ellipse(headX, headY + headD*0.38, headD*0.33, headD*0.08);
  
  //legs
   stroke(0);
  float legStartY = bodyY + bodyH * 0.50;
  float legLen = h * 0.20;
  float footLen = w * 0.08;

  // left leg (2 segments like your original)
  line(x - bodyW*0.40, legStartY, x - bodyW*0.80, legStartY + legLen);
  line(x - bodyW*0.80, legStartY + legLen, x - bodyW*0.80 - footLen, legStartY + legLen);

  // right leg
  line(x + bodyW*0.40, legStartY, x + bodyW*0.80, legStartY + legLen);
  line(x + bodyW*0.80, legStartY + legLen, x + bodyW*0.80 + footLen, legStartY + legLen);

  //ARMS
  line(x - bodyW*0.40, bodyY, x - w*0.45, bodyY - h*0.18);
  line(x + bodyW*0.40, bodyY, x + w*0.45, bodyY + h*0.10);
}
