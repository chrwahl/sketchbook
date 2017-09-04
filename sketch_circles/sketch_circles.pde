ArrayList<Circle> circles;

void setup(){
  size(400,400);
  newCircles();
  noLoop();
  colorMode(HSB, 100);
}

void draw() {
  for(Circle c : circles){
    c.display();
  }
}

void mouseClicked(){
  newCircles();
  redraw();
}

void newCircles(){
  circles = new ArrayList<Circle>();
  for(int i = 0; i < 4; i++){
    color c = color(random(255), random(255), random(255), random(255));
    circles.add(new Circle(random(width),random(height), random(400), c));
  }
}

class Circle{
  float posx;
  float posy;
  float size;
  color col;

  Circle(float x, float y, float s, color c){
    posx = x;
    posy = y;
    size = s;
    col = c;
  }
  
  void display(){
    fill(col);
    noStroke();
    ellipse(posx, posy, size, size);
  }
}