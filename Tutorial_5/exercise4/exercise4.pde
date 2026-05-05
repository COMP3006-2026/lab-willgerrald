String[] lines = {"", "", ""};

int currentLine = 0;
int maxWidth = 320;   //maximum width of each line in pixels

void setup() {
  size(500, 250);
  textSize(24);
  textAlign(LEFT, TOP);
}

void draw() {
  background(255);

  fill(0);
  text("Simple 3-Line Text Editor", 20, 20);

  //draw text box
  noFill();
  stroke(0);
  rect(20, 60, 360, 120);

  //draw the 3 lines
  fill(0);
  text(lines[0], 30, 70);
  text(lines[1], 30, 105);
  text(lines[2], 30, 140);
}

void keyPressed() {
  //BACKSPACE: delete last character
  if (key == BACKSPACE) {
    if (lines[currentLine].length() > 0) {
      lines[currentLine] = lines[currentLine].substring(0, lines[currentLine].length() - 1);
    } 
    else if (currentLine > 0) {
      currentLine--;
      if (lines[currentLine].length() > 0) {
        lines[currentLine] = lines[currentLine].substring(0, lines[currentLine].length() - 1);
      }
    }
  }

  //ENTER: go to next line
  else if (key == ENTER || key == RETURN) {
    if (currentLine < 2) {
      currentLine++;
    }
  }

  //normal typing
  else if (key != CODED) {
    String testLine = lines[currentLine] + key;

    //if line too long, move to next line automatically
    if (textWidth(testLine) > maxWidth) {
      if (currentLine < 2) {
        currentLine++;
        lines[currentLine] += key;
      }
    } else {
      lines[currentLine] += key;
    }
  }
}
