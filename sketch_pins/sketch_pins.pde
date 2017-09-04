float a1 = 0;
float a2 = 0;

void setup() {
  size(400, 400, P2D);
  //background(0);
  frameRate(20);
  
}

void draw() {
  clear();
  translate(width/2, height/2);
  rotate(a1);
  translate(50,0);
  stroke(255);
  strokeWeight(5);
  line(0,0,50,0);
  translate(50,0);
  rotate(a2);
  line(0,0,50,0);
  a1 = (a1+PI/50 > TWO_PI) ? 0 : a1+PI/50;
  a2 = (a2-PI/5 < 0) ? TWO_PI : a2-PI/5;
}