class Star {
  int x,y,r,speed;
  
  Star(int x, int y){
    this.x = x;
    this.y = y;
    r = int(random(1,4));
    speed = int(random(1,3));
  }
  
  void display() {    
    noStroke();
    fill(random(127,222));
    ellipse(x,y,r,r);
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
}
