size(200, 200); //board size
background(255); // BG color
smooth(); //smoother print

// Set ellipse and rets to center mode
ellipseMode(CENTER); //position
rectMode(CENTER); //rectangle position

//// Draw Zoog's body
stroke(0); // line color
fill(0,255,220); // fill color
rect(100,100,25,100); //rectangle size

//Draw Zoog's head
fill(255); //fill head (color)
ellipse(100,70,60,60); //(X,Y, side to side diameter, top to bottom diameter)

//Draw Zoog's eyes;
fill(0); //fill eyes (color)
ellipse(81,70,8,16); // left eye(X,Y, side to side diameter, top to bottom diameter)
ellipse(119,70,8,16); //right eye(X,Y, side to side diameter, top to bottom diameter)

//Draw Zoog's brows;
stroke(255,0,0);
line(80,50,90,65);
line(120,50,110,65);

//Draw Zoog's Nose
fill(255,0,0);
ellipse(100,80,10,10);

//Draw Zoog's mouth
fill(0);
ellipse(100,93,20,5);

//Draw Zoog's leg
stroke(0);
line(90, 150, 80, 175);
line(80, 175, 70, 175);

line(110, 150, 120, 175);
line(120, 175, 130, 175);

//Draw Zoog's arms
line(90, 100, 50, 70);
line(110, 100, 150, 120);
