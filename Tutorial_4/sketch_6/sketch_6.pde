PrintWriter file;
String input = "";

void setup() {
  size(400,200);
  file = createWriter("words.txt");
}

void draw() {
  background(255);
  fill(0);
  textSize(16);
  text("Input: " + input, 20, 100);
  text("SPACE = save | ENTER = exit", 20, 130);
}

void keyPressed() {
  //accept digits
  if (key >= '0' && key <= '9') {
    input += key;
  }

  //accept decimal point only once
  else if (key == '.' && input.indexOf('.') == -1) {
    input += key;
  }

  // SPACE key to save number into the file
  else if (key == ' ') {
    if (input.length() > 0) {
      if (input.indexOf('.') >= 0) {     // FLOAT
        float f = float(input);
        file.println(String.format("%06.4f", f));
      } 
      else {                             // INTEGER
        int i = int(input);
        file.println(String.format("%010d", i));
      }
      println("Saved: " + input);
      input = "";
    }
  }

  // BACKSPACE support
  else if (key == BACKSPACE && input.length() > 0) {
    input = input.substring(0, input.length()-1);
  }

  // ENTER to flush, close, exit
  else if (key == ENTER || key == RETURN) {
    file.flush();
    file.close();
    println("File saved. Program exiting.");
    exit();
  }
}
