//Computer History Timeline
//By Nicholai Gontcharov  
// 9/7/18

void setup() {
  size(900, 400);
  background(155);
}

void draw() {
  background(155);
  textSize(45);
  textAlign(CENTER);
  fill(0);
  text("Historic Computer Systems", width/2, 45);
  fill(255);
  textSize(20);
  text("By Nicholai Gontcharov", width/2, 75);

  strokeWeight(3);
  line(100, 210, 800, 210);

  //add 8 historic events 
  fill(0);
  histEvent("ENIAC - 1946", "It was over 1000 tomes faster than any previous computer. Over 1000 square feet and weighted 30 tons United States Feb 15th, 1946. Tech type: Vacuum tubes \n", 75, 160, true);
  histEvent("ERA-1101 - 1950", "One of the first commercially produced computers. First customer was the US Navy. Stored 1 million bits on a magnetic drum Untied States December 1951. Tech type: vacuum tubes", 162, 260, false);
  histEvent("SAGE-1958", "First large-scale computer communications network. Its task was to detect incoming Soviet bombers and intercept aircraft United States June 26, 1958", 249, 160, true);
  histEvent("HP-2116a - 1966", "Was a versatile instrument controller. It interfaced with a wide number of laboratory instruments", 336, 260, false);
  histEvent("Tandem-16 - 1975", "It was made for online tranaction processing. \n Was big gor the banking industry.", 423, 160, true);
  histEvent("Apple II - 1977", "Came in a good set, was made for the hobbyist community. When connected with a color TV it produced brilliant colors for the time.", 510, 260, false);
  histEvent("IBM PC - 1982", "The ignition of the personal computer", 597, 160, true);
  histEvent("Macintosh Portable - 1989", "Descriptive Text", 684, 260, false);
}


void histEvent(String name, String descr, int x, int y, boolean top) {
  textSize(12);
  textAlign(LEFT);
  /*line(100, 185, 130, 210);
   line(200, 245, 230, 210);
   line(300, 185, 330, 210);
   line(400, 245, 430, 210);
   line(500, 185, 530, 210);
   line(600, 245, 630, 210);
   line(700, 185, 730, 210);
   line(750, 245, 780, 210);
   */

  // determine tom or bottom events
  if (top) {
    text(name, x, y);
    line(x, y, x+30, y+30);
  } else { 
    text(name, x, y+25);
    line(x, y, x+30, y-30);
  }

  //find location of mouse for display description
  if (mouseX>x-50 && mouseX < x+50 && mouseY > y-15 && mouseY < y+30) {
    if (top) {
      textSize(12);
      text(descr, x, y+25);
    } else {
      textSize(12);
      text(descr, x, y+45);
    }
  }
}
