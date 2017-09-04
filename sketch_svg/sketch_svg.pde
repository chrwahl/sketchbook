PShape tool;

void setup() {
  size(100, 100);
  tool = loadShape("tool.svg");
  noLoop();
}

void draw() {
  background(255);
  shape(tool, 0, 0, 100, 100);
  save("img/test.png");
}