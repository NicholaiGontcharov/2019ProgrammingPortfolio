// SpaceShip Game
//By: Nicholai Gontcharov 12/03/18

Table tResults;
TableRow tr1;

ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
Timer timer;
Timer puTimer;
Timer ticTimer;
int health = 100;
int pass = 0;
int level = 1;
int rockRate = 1000;
int rockCount = 0;
int laserCount = 0;
int score = 0;  
boolean ticker = false;
boolean play = false;
String ticText = "";
String name = "Nick";
SpaceShip sl;   

import processing.sound.*;
SoundFile file;


void setup() {
  size(1000, 1000);
  tResults = loadTable("results.cvs", "header");
  file = new SoundFile(this, "fire.wav");
  file.play();
  rocks = new ArrayList<Rock>();
  lasers = new ArrayList<Laser>();
  timer = new Timer(rockRate);
  ticTimer = new Timer(2000);
  timer.start();
  sl = new SpaceShip(0, 0, 20);
}




void draw() {
  background(20);
  noCursor();
  if (!play) {
    startScreen();
  } else {
    
    // Level Handling 
    if (frameCount % 1000 == 10) {
      level++;
      ticText = "Level: " + level;
      ticker();
      rockRate-=50;
      timer.totalTime = rockRate;
    }
    
    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -20, int(random(4)), true));
      timer.start();
    }

    //render rocks

    //for (int i = rocks.size()-1; i>=0; i--) {
    //  Rock rock = (Rock) rocks.get(i);
    //  rock.move();
    //  rock.display();
    //  if (rock.reachedBottom()) {
    //    rocks.remove(rock);
    //  }  
    //  // Add Collision Detection Here
    //  for (int j = lasers.size()-1; j>=0; j--) {
    //    Laser l = (Laser) lasers.get(j);
    //    if (dist(l.x, l.y, rock.x, rock.y) < rock.r) {
    //      rock.health-=1;
    //      score ++;
    //      println(score);
    //      rocks.get(i).health -= 50;
    //      if (rocks.get(i).health < 15) {
    //        rocks.remove(rocks.get(i));
    //      }
    //      lasers.remove(lasers.get(j));
    //    }                                                  //Detect an intersection
    //  }
    //}

 // Add rocks based on timer
    if (timer.isFinished()) {
      if (random(101)>10) {
        rocks.add(new Rock(int(random(width)), -20, int(random(3)), false));
      } else {
        rocks.add(new Rock(int(random(width)), -20, int(random(3)), true));
      }

      rockCount++;
      //totalRocks++ ;
      timer.start();
    }

    // All Collision Detection
    for (int i = rocks.size()-1; i>=0; i--) {
      Rock rock = (Rock) rocks.get(i);
      rock.move();
      rock.display();
      if (rock.reachedBottom()) {
        pass++;
        rocks.remove(rock);
      }
      for (Laser l : lasers) {
        if (dist(l.x, l.y, rock.x, rock.y) < rock.r) {
          rock.health-=1;
        }
        if (rock.health<10) {
          rocks.remove(rock);
          score+=rock.r;
        }
      }
      if (dist(sl.x, sl.y, rock.x, rock.y) < sl.r) {
        if (rock.isPU) {
          health+=10;
          rocks.remove(rock);
        } else {
          rocks.remove(rock);
          rock.health-=10;
          health-=rock.r;
        }
      }
    }
    //Display lasers
    for (int i = lasers.size()-1; i>=0; i--) {
      Laser laser = (Laser) lasers.get(i);
      laser.fire();
      laser.display();
      if (laser.reachTop()) {
        lasers.remove(laser);
      }
    }
    sl.display(mouseX, mouseY);
    infoPanel();
  } if (ticker) {
      if (!ticTimer.isFinished()) {
        fill(255, 127);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      } else if (!ticTimer.isFinished() && health < 30) {
        fill(255, 127);
        textSize(44);
        textAlign(CENTER);
        text(ticText, width/2, height/2);
      }
   if (health<1 || pass>10) {
      play = false;
      gameOver();
    //} else {
    //  play = true;
    } 
  }
}
        
void infoPanel() {
  fill(200);
  textAlign(LEFT);
  textSize(25);
  text("Score: " + score, 20, height-90);
  text("Level: " + level, 20, height-60);
 
  if (health<20) {
    fill(255, 0, 0);
  } else {
    fill(48, 228, 0);
  }
  text("Health: " + health, 400, height-30);
  if (pass>8) {
    fill(255, 0, 0);
  } else {
    fill(122);
  }
}


void startScreen() {
  background (0);
  textAlign(CENTER);
  fill(150);
  text("Click to Continue...", width/2, height/2);
  fill(255);
  textSize(26); 
  text("ASTROID", width/2, height/3);
  //tResults.sort("SCORE");
 //tr1 = tResults.getRow(tResults.getRowCount()-1);
 //text("High Score: " + tr1.getString("SCORE") + "By: " + tr1.getString("NAME"), width/2, height/2+40);
  
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  //text("Final Score:" + score, width/2, height/2+20);
  //text("You made it to level " + level, width/2, height/2+40);
  //text("Targets: " + rockCount, width/2, height/2+80);
  //text("Health: " + health, width/2, height/2+100);
  //text("Targets Passed: " + pass, width/2, height/2+120);
  //TableRow newRow = tResults.addRow();
  //newRow.setString("NAME", name);
  //newRow.setString("SCORE", str(score));
  //newRow.setString("LEVEL", str(level));
  //newRow.setString("ROCKS", str(rockCount));
  //newRow.setString("HEALTH", str(health));
  //newRow.setString("PASS", str(pass));
  //saveTable(tResults, "data/results.csv");

 //tResults.sort("SCORE");
 //tr1 = tResults.getRow(tResults.getRowCount()-1);
  //text("High Score: " + tr1.getString("SCORE"), width/2, height/2+140);
  noLoop();
}

void ticker() {
  ticTimer.start();
  ticker = true;
  if (ticTimer.isFinished()) {
    ticker = false;
  }
}

void keyPressed() {
  if (key == ' ') {
    lasers.add(new Laser(sl.x, sl.y, color(255, 255, 0)));
    file.play();
  }
}
