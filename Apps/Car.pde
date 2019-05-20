class Car {
  // member variables
  color c;
  float xpos, ypos, xspeed;

  //constructor
  Car (color c, float xpos, float ypos, float xspeed) {
    this.c =c;
    this.xpos = xpos;
    this.ypos = ypos;
    this.xspeed = xspeed;
  }
  // Method for behavior
  void display () {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
  }
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
