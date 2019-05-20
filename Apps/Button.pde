class Button {
  // member variables
  int x, y, w, h, v;
  String op;
  color c;
  boolean hov, num;

  // multiple constructors

  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hov = false;
  }

  Button asNumber(int v) {
    this.v = v;
    num = true;
    return this;
  }

  Button asOperator(String op) {
    this.op = op;
    num = false;
    return this;
  }

  // display method
  void display() {
    if (num) {

      if (hov) {
        fill(255, 107, 114);
      } else {
        fill(200);
      }
      rect(x, y, w, h, 15);
      fill(0);
      textSize(50);
      text(v, x+55, y+55);
    } else {
      if (hov) {
        fill(255, 107, 114);
      } else {
        fill(200);
      }
      rect(x, y, w, h, 15);
      fill(0);
      textSize(50);
      text(op, x+55, y+55);
    }
  }

  // hov method
  void hov() {
    hov = mouseX > x-0 && mouseX < x+80 && mouseY > y-0 && mouseY < y+80;
  }
}
