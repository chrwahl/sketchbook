
void setup() {
  size(400, 400);
  frameRate(10);
  //noLoop();
}

void draw() {
  clear();
  stroke(255);
  line(200, 10, 200, 390);
  line(10, 200, 390, 200);

  l(1, 10); //y = x*s+t;
  m(.1, -10);//y = s*x2+t
  n(15, 30);//sin
  o(5, 90);//tan
}

void l(float s, float t) {
  for (int i = -19; i < 20; i++) {
    float x = 200+i*10;
    float y = 200-s*i*10-t*10;
    fill(0,0,255);
    noStroke();
    ellipse(x,y,5,5);
  }
}

void m(float s, float t) {
  for (int i = -19; i < 20; i++) {
    float x = 200+i*10;
    float y = 200-s*pow(i, 2)*10-t*10;
    fill(255,0,0);
    noStroke();
    ellipse(x,y,5,5);
  }
}

void n(float s, float t) {
  for (int i = -19; i < 20; i++) {
    float x = 200+i*10;
    float y = 200-s*sin(i*TWO_PI/t)*10;
    fill(0,255,0);
    noStroke();
    ellipse(x,y,5,5);
  }
}

void o(float s, float t) {
  for (int i = -19; i < 20; i++) {
    float x = 200+i*10;
    float y = 200-s*tan(i*TWO_PI/t)*10;
    fill(255,255,0);
    noStroke();
    ellipse(x,y,5,5);
  }
}