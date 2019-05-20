class SpaceShip {
  // Member Variables
  int x, y, r, lives;
  float hp, speed, dir;
  boolean alive;
  PImage photo; 


  //Constructor
  SpaceShip( int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    hp = 100.0;
    speed = 5;
    dir = 0;
    alive = true;
    photo = loadImage("Ship.png");
  }

  //Display methods 
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    fill(128);
    
    image(photo, x-90, y-60);
  }

  //Behavior methods
  void thrust() {
  }

  void fire() {
  }
}
