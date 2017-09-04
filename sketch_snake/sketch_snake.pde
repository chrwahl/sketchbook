Snake s;
ArrayList<Item> items;

void setup(){
  size(200,200);
  background(100,200,100);
  frameRate(10);
  s = new Snake(width/2,height/2);
  items = new ArrayList<Item>();
}

void draw(){
  clear();
  background(100,200,100);
  
  if(s.posx < 0 || s.posx > width || s.posy < 0 || s.posy > height){
    s.die();
  }else{
    s.move();
  }
  
  if(items.size() < 3){
    items.add(new Item(parseInt(random(width/10))*10,parseInt(random(height/10))*10));
  }
  for(Item item : items){
    if(s.posx == item.posx && s.posy == item.posy){
      item.hit = true;
      s.length++;
    }
  }
  for(int i = items.size(); i > 0; i--){
    if(items.get(i-1).hit) items.remove(i-1);
  }
  
  if(s.alive){
    s.display();
    for(Item item : items){
      item.display();
    }
  }else{
    //game over
    noLoop();
  }
}


void keyPressed(){
  s.go(keyCode);
}

class Snake{
  int posx;
  int posy;
  int size;
  int direction;
  int length;
  ArrayList<int[]> points;
  Boolean alive;
  
  Snake(int x, int y){
    posx = x;
    posy = y;
    direction = RIGHT;
    size = 10;
    points = new ArrayList<int[]>();
    length = 5;
    alive = true;
  }
  
  void go(int dir){
    if(direction == LEFT && dir == RIGHT)
      dir = LEFT;
    else if(direction == RIGHT && dir == LEFT)
      dir = RIGHT;
    else if(direction == UP && dir == DOWN)
      dir = UP;
    else if(direction == DOWN && dir == UP)
      dir = DOWN;
    if(direction != dir){
      int[] pos = {posx,posy};
      points.add(pos);
    }
    direction = dir;
    print(dir);
  }
  
  void move(){
    switch(direction){
      case RIGHT:
        posx += size;
        break;
      case LEFT:
        posx -= size;
        break;
      case UP:
        posy -= size;
        break;
      case DOWN:
        posy += size;
        break;
    }
    int[] pos = {posx,posy};
    
    for(int[] point : points){
      if(point[0] == pos[0] && point[1] == pos[1]){
        alive = false;
      }
    }
    points.add(pos);
  }
  
  void display(){
    while(points.size() > length){
      points.remove(0);
    }
    fill(0);
    noStroke();
    for(int[] pos : points){
      rect(pos[0],pos[1],size,size);
    }
  }
  
  void die(){
    alive = false;
  }
}

class Item{
  int posx;
  int posy;
  Boolean hit;
  
  Item(int x, int y){
    posx = x;
    posy = y;
    hit = false;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    if(hit) fill(0);
    rect(posx,posy,10,10);
  }
}