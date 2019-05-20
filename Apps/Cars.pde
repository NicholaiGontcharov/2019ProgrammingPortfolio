Car myCar;
Car[] myCars = new Car[200];
void setup() {
  size(400, 800);
  myCar = new Car(color(random(255), random(255), random(255)), random(width), random(height), random(2, 10));
  for (int i=0; i<myCars.length; i++) {
    myCars[i] = new Car(color(random(255), random(255), random(255)), random(width), random(height), random(2, 10));
  }
}
void draw() {
  background(127);
  myCar.display();
  myCar.drive();
  for (int i=0; i<myCars.length; i++) {
    myCars[i].display();
    myCars[i].drive();
  }
}
