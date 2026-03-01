Person p1, p2, p3, p4;

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);

  //4 different persons with different positions,sizes,colours,speeds
  p1 = new Person(110, 260, 90, 180, color(0, 255, 220), 0, 0);
  p2 = new Person(260, 200, 120, 220, color(255, 180, 0), 0, 2.5); // <-- moves vertically + bounces
  p3 = new Person(420, 270, 80, 160, color(160, 90, 255), 0, 0);
  p4 = new Person(540, 240, 100, 200, color(255, 80, 120), 0, 0);
}

void draw() {
  background(255);

  // draw all persons
  p1.display();
  p2.display();
  p3.display();
  p4.display();

  // move the second person vertically and bounce back at same speed
  p2.moveVerticalBounce();
}

//Person Class
class Person {

  // attributes
  float x, y;          //torso center position
  float w, h;          //total width & height of the person
  color bodyColor;     //body colour
  float vx, vy;        //velocities (horizontal / vertical)

  Person(float x, float y, float w, float h, color c, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bodyColor = c;
    this.vx = vx;
    this.vy = vy;
  }

  //draw the person
  void display() {
    stroke(0);

    //proportions
    float bodyW = w * 0.25;
    float bodyH = h * 0.50;

    float headD = w * 0.50;

    float legLen = h * 0.22;
    float footLen = w * 0.10;

    float armLenX = w * 0.55;

    //torso
    fill(bodyColor);
    rect(x, y, bodyW, bodyH);

    //head
    float headX = x;
    float headY = y - bodyH * 0.65;
    fill(255);
    ellipse(headX, headY, headD, headD);

    //eyes
    float eyeOffsetX = headD * 0.28;
    float eyeW = headD * 0.12;
    float eyeH = headD * 0.22;
    fill(0);
    ellipse(headX - eyeOffsetX, headY, eyeW, eyeH);
    ellipse(headX + eyeOffsetX, headY, eyeW, eyeH);

    //eyebrows
    stroke(255, 0, 0);
    line(headX - eyeOffsetX - headD*0.06, headY - headD*0.30,
         headX - eyeOffsetX + headD*0.10, headY - headD*0.12);
    line(headX + eyeOffsetX + headD*0.06, headY - headD*0.30,
         headX + eyeOffsetX - headD*0.10, headY - headD*0.12);

    //nose
    stroke(0);
    fill(255, 0, 0);
    ellipse(headX, headY + headD*0.16, headD*0.16, headD*0.16);

    //mouth
    fill(0);
    ellipse(headX, headY + headD*0.36, headD*0.32, headD*0.08);

    //legs
    stroke(0);
    float hipY = y + bodyH * 0.50;
    float leftHipX  = x - bodyW * 0.30;
    float rightHipX = x + bodyW * 0.30;

    //left leg
    line(leftHipX, hipY, leftHipX - bodyW*0.25, hipY + legLen);
    line(leftHipX - bodyW*0.25, hipY + legLen, leftHipX - bodyW*0.25 - footLen, hipY + legLen);

    //right leg
    line(rightHipX, hipY, rightHipX + bodyW*0.25, hipY + legLen);
    line(rightHipX + bodyW*0.25, hipY + legLen, rightHipX + bodyW*0.25 + footLen, hipY + legLen);

    //arms
    float shoulderY = y - bodyH * 0.35;
    //left arm 
    line(x - bodyW*0.50, shoulderY, x - armLenX, shoulderY - h*0.18);
    //right arm 
    line(x + bodyW*0.50, shoulderY, x + armLenX, shoulderY + h*0.10);
  }

  //move vertically and bounce back at the same speed
  void moveVerticalBounce() {
    y += vy;

    //keep the whole person roughly inside the window
    float topLimit = h * 0.35;
    float bottomLimit = height - h * 0.15;

    if (y < topLimit || y > bottomLimit) {
      vy = -vy; //reverse direction (same speed)
    }
  }
}
