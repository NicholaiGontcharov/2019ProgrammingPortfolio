class Rock {    
  int x, y, t; 
  float speed; 
  color c;
  int r; 
  int health;
  boolean isPU;

  Rock(int x, int y, int t, boolean isPU) {
    r = int(random(35, 75)); 
    this.x = x;
    this.y = y;
    this.t = t;
    this.isPU = isPU;
    speed =     (random(1, 3));    
    c = color(random(127), random(122), 111); 
    health = r;
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    switch(t) {
    case 0: 
      noStroke();
      fill(127, 62, 0);
      ellipse(x, y, health, health);
      fill(180);
      ellipse(x+2, y-3, 3, 5);
      ellipse(x-8, y-3, 4, 3);
      ellipse(x+2, y+13, 8, 8);
      ellipse(x+8, y-8, 3, 5);
      ellipse(x-7, y-5, 1, 1);
      break;
    case 1: 
      noStroke();
      fill(115);
      ellipse(x, y, health, health);
      fill(185);
      ellipse(x-2, y+3, 4, 3);
      ellipse(x+7, y-7, 3, 3);
      ellipse(x-7, y-5, 3, 3);
      ellipse(x+7, y-5, 2, 2);
      break;
    case 2: 
      noStroke();
      fill(185);
      ellipse(x, y, health, health);
      fill(30);
      ellipse(x-7, y-5, 3, 2);
      ellipse(x-2, y-1, 2, 3);
      ellipse(x+3, y+5, 3, 4);
      ellipse(x+4, y+5, 3, 5);
      ellipse(x-2, y-2, 3, 5);
      break;
      case 3:
      if(isPU) {
      fill(255,33,33);
    } else {
      if(health<10) {
        fill(255,255,0);
      }else {
        fill(c-health);
      }
    }
    
    noStroke();
    ellipse(x,y,health,health);
    fill(255);
    textSize(9);
    textAlign(CENTER);
    if(isPU){
      text("PU",x,y+5);
    } else {
      text(health,x,y+5);
    }
      
    }
  }
}  
