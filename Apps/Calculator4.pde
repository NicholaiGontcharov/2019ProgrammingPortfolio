//Nicholai Gontcharov
//Period: B-4
//  10/31/18

Button [] numBtns = new Button[10];
Button [] opBtns = new Button[8];
String displayVal, leftVal, rightVal;
char opVal;
float result;
boolean firstNum, dec;




void setup() {
  size (544, 840);
  opBtns[0] = new Button(30, 208, 80, 80).asOperator("C");
  opBtns[1] = new Button(168, 208, 80, 80).asOperator("√");
  opBtns[2] = new Button(296, 208, 80, 80).asOperator("÷");
  opBtns[3] = new Button(424, 208, 80, 80).asOperator("×");

  numBtns[7]  = new Button(30, 336, 80, 80).asNumber(7);
  numBtns[8]  = new Button(168, 336, 80, 80).asNumber(8);
  numBtns[9]  = new Button(296, 336, 80, 80).asNumber(9);
  opBtns[4] = new Button(424, 336, 80, 80).asOperator("-");
  numBtns[4]  = new Button(30, 464, 80, 80).asNumber(4);
  numBtns[5]  = new Button(168, 464, 80, 80).asNumber(5);
  numBtns[6]  = new Button(296, 464, 80, 80).asNumber(6);
  opBtns[5] = new Button(424, 464, 80, 80).asOperator("+");
  numBtns[1]  = new Button(30, 592, 80, 80).asNumber(1);
  numBtns[2]  = new Button(168, 592, 80, 80).asNumber(2);
  numBtns[3]  = new Button(296, 592, 80, 80).asNumber(3);
  opBtns[6] = new Button(424, 592, 80, 208).asOperator("=");
  numBtns[0] = new Button(30, 720, 208, 80).asNumber(0);
  opBtns[7] = new Button(296, 720, 80, 80).asOperator(".");
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
}

void draw() {
  background(162, 220, 255);
  for (int i = 0; i< numBtns.length; i++) {
    numBtns[i].display();
    numBtns[i].hov();
  }
  for (int i = 0; i< opBtns.length; i++) {
    opBtns[i].display();
    opBtns[i].hov();
  }
  updateDisplay();
}
void updateDisplay() {
  fill(220);
  rect(20, 10, 500, 180, 10);
  fill(0);
  textAlign(RIGHT);
  textSize(40);
  text(displayVal, 500, 170);
}

void mouseReleased() {
  for (int i = 0; i< numBtns.length; i++) {
    if (numBtns[i].hov) {
      if (firstNum) {
        leftVal += str(numBtns[i].v);
        displayVal = leftVal;
      } else {
        rightVal += str(numBtns[i].v);
        displayVal = rightVal;
      }
    }
  }
  for (int i = 0; i< opBtns.length; i++) {
    if (opBtns[i].hov) {
      if (opBtns[i].op == "+") {
        opVal = '+';
        firstNum = false;
      } else if (opBtns[i].op == "-") {
        opVal = '-';
        firstNum = false;
      } else  if (opBtns[i].op == "×") {
        opVal = '×';
        firstNum = false;
      } else  if (opBtns[i].op == "÷") {
        opVal = '÷';
        firstNum = false;
      } else  if (opBtns[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayVal = leftVal;
        } else{ 
        rightVal = str(sqrt(float(leftVal)));
        displayVal = rightVal;
        }
      } else if (opBtns[i].op == "=") {
        performCalc();
      } else if (opBtns[i].op == "C") {
        clearButton();
      } else if (opBtns[i].op == ".") {
        if (!dec) {
          if (firstNum) {
            leftVal += opBtns[i].op;
            displayVal = leftVal;
            dec = true;
          } else {
            rightVal += opBtns[i].op;
            displayVal = rightVal;
            dec = true;
          }
        }
      }
    }
  }
}

void performCalc() {
  if (opVal == '+') {
    result = float(leftVal) + float(rightVal);
    displayVal = str(result);
  } else if (opVal == '-') {
    result = float(leftVal) - float(rightVal);
    displayVal = str(result);
  } else if (opVal == '×') {
    result = float(leftVal) * float(rightVal);
    displayVal = str(result);
  } else if (opVal == '÷') {
    result = float(leftVal) / float(rightVal);
    displayVal = str(result);
  }
  firstNum = true;
}

void clearButton () {
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
}

void keyPressed() {
  if (key == '1') {
    handleKeyPress(true, "1");
  } else if (key == '2') {
    handleKeyPress(true, "2");
  }else if (key == '3') {
    handleKeyPress(true, "2");
  }else if (key == '4') {
    handleKeyPress(true, "2");
  }else if (key == '5') {
    handleKeyPress(true, "2");
  }else if (key == '6') {
    handleKeyPress(true, "2");
  }else if (key == '7') {
    handleKeyPress(true, "2");
  }else if (key == '8') {
    handleKeyPress(true, "2");
  }else if (key == '9') {
    handleKeyPress(true, "2");
  }
  else if (key == '0') {
    handleKeyPress(true, "2");
  }
}

void handleKeyPress(boolean num, String var) {
  if (num) {
    if (firstNum) {
      leftVal += var;
      displayVal = leftVal;
    } else if (firstNum) {
      rightVal += var;
      displayVal = rightVal;
    }
  }else {
   if (var == "+") {
         opVal = '+';
         firstNum = false;
         dec = true;
   } else if (var == "-") {
         opVal = '-';
         firstNum = false;
         dec = true;
   }  else if (var == "×") {
         opVal = '*';
         firstNum = false;
         dec = true;
   }
  }
  
}
