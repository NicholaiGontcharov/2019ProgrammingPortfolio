// SpaceShip Design
//By: Nicholai Gontcharov
// 9/25/18

void setup() {
  size(100, 100);
}

void draw() {
  noCursor();
  background(0);
  drawShip(mouseX, mouseY);
}

void drawShip(int x, int y) {
  //Hull
  fill(200);
  //wings
  triangle(x, y-40, x+45, y+35, x, y+25);
  triangle(x, y-40, x-45, y+35, x, y+25);
  //Pilot
  ellipse(x, y, 8, 20);
 
}
