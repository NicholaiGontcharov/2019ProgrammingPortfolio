    class Laser {
  //Member Variables
  int x, y, w, h, speed;
  color c1;
  boolean active;
  //constructor
  Laser(int x, int y, color c1) {
    this.x = x;
    this.y = y;
    w = 2;
    h = 20;
    speed = 5;
    this.c1 = c1;
    active = true;
  }
  //Display Method
  void display() {
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void fire() {
    y -= speed;
  }

  //void move?

  boolean reachTop() {
    if (y<0+h) {
      return true;
    } else { 
      return false;
    }
  }
}
