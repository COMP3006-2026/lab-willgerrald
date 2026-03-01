Person[] people = new Person[10];

void setup() {
  size(800, 450);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);

  //create 10 persons with random position, size, colour, and random velocity
  for (int i = 0; i < people.length; i++) {
    float h = random(110, 240);           // height controls overall size
    float w = h * random(0.40, 0.65);     // width proportional to height
    float x = random(w*0.7, width - w*0.7);
    float y = random(h*0.5, height - h*0.2);

    color c = color(random(30, 255), random(30, 255), random(30, 255));

    //random direction + speed (avoid 0 velocity)
    float vx = random(-2.5, 2.5);
    float vy = random(-2.5, 2.5);
    if (abs(vx) < 0.5) vx = (vx < 0 ? -0.8 : 0.8);
    if (abs(vy) < 0.5) vy = (vy < 0 ? -0.8 : 0.8);

    people[i] = new Person(x, y, w, h, c, vx, vy);
  }

  //sort array by height (ascending)
  sortByHeight(people);
}

void draw() {
  background(255);

  //move + bounce + draw all persons
  for (int i = 0; i < people.length; i++) {
    people[i].moveAndBounce();
    people[i].display();
  }

  //small label
  fill(0);
  text("Sorted by height (ascending). All move randomly + bounce.", 10, 20);
}

//sorting
void sortByHeight(Person[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - 1 - i; j++) {
      if (arr[j].h > arr[j + 1].h) {   // compare height
        Person tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
      }
    }
  }
}

//Person Class
class Person {
  float x, y;
  float w, h;
  color bodyColor;
  float vx, vy;

  Person(float x, float y, float w, float h, color c, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bodyColor = c;
    this.vx = vx;
    this.vy = vy;
  }

  void display() {
    stroke(0);

    //proportions relative to w/h
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
    fill(0);
    ellipse(headX - eyeOffsetX, headY, headD * 0.12, headD * 0.22);
    ellipse(headX + eyeOffsetX, headY, headD * 0.12, headD * 0.22);

    // eyebrows
    stroke(255, 0, 0);
    line(headX - eyeOffsetX - headD*0.06, headY - headD*0.30,
         headX - eyeOffsetX + headD*0.10, headY - headD*0.12);
    line(headX + eyeOffsetX + headD*0.06, headY - headD*0.30,
         headX + eyeOffsetX - headD*0.10, headY - headD*0.12);

    //nose
    stroke(0);
    fill(255, 0, 0);
    ellipse(headX, headY + headD * 0.16, headD * 0.16, headD * 0.16);

    //mouth
    fill(0);
    ellipse(headX, headY + headD * 0.36, headD * 0.32, headD * 0.08);

    //legs
    stroke(0);
    float hipY = y + bodyH * 0.50;
    float leftHipX  = x - bodyW * 0.30;
    float rightHipX = x + bodyW * 0.30;

    line(leftHipX, hipY, leftHipX - bodyW * 0.25, hipY + legLen);
    line(leftHipX - bodyW * 0.25, hipY + legLen, leftHipX - bodyW * 0.25 - footLen, hipY + legLen);

    line(rightHipX, hipY, rightHipX + bodyW * 0.25, hipY + legLen);
    line(rightHipX + bodyW * 0.25, hipY + legLen, rightHipX + bodyW * 0.25 + footLen, hipY + legLen);

    //arms
    float shoulderY = y - bodyH * 0.35;
    line(x - bodyW * 0.50, shoulderY, x - armLenX, shoulderY - h * 0.18);
    line(x + bodyW * 0.50, shoulderY, x + armLenX, shoulderY + h * 0.10);
  }

  void moveAndBounce() {
    x += vx;
    y += vy;

    //bounce boundaries
    float leftLimit   = w * 0.45;
    float rightLimit  = width - w * 0.45;
    float topLimit    = h * 0.45;
    float bottomLimit = height - h * 0.10;

    if (x < leftLimit || x > rightLimit) {
      vx = -vx;
      //clamp back inside to avoid sticking
      x = constrain(x, leftLimit, rightLimit);
    }

    if (y < topLimit || y > bottomLimit) {
      vy = -vy;
      y = constrain(y, topLimit, bottomLimit);
    }
  }
}
