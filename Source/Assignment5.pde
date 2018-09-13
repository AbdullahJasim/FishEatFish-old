int numFish = 10;
ArrayList fishList = new ArrayList();
ArrayList eFishList = new ArrayList();
AvatarFish player;
SharkFish shark;
boolean keyUp, keyDown, keyLeft, keyRight, ready, restart;
int health = 5;
PImage bg;
Texts txt;

void setup() {
  smooth();
  size(1152, 750);
  
  txt  = new Texts();
  
  ready = false;
  bg = loadImage("Ocean.JPG");

  player  = new AvatarFish(width/2, height-100);
  shark  = new SharkFish ();

  keyUp = keyDown = keyLeft = keyRight = false;

  for (int i = 0; i < numFish; i++) {
    fishList.add (new Fish());
    eFishList.add (new EnemyFish());
  }//for
  respawn();
}//setup

void keyPressed() {
  if (key == 'w') keyUp = true; 
  if (key == 's') keyDown = true; 
  if (key == 'a') keyLeft = true; 
  if (key == 'd') keyRight = true;
  if (key == 'r') ready = true;
  if (key == 't') restart = true;
} //keyPressed

void keyReleased() {
  if (key == 'w') keyUp = false; 
  if (key == 's') keyDown = false; 
  if (key == 'a') keyLeft = false; 
  if (key == 'd') keyRight = false;
} //keyReleased

SharkFish respawns() {
  return new SharkFish();
}//respawn

void respawn() {
  player.x = width/2;
  player.y = height-100;
  player.alive = true;
}//respawn

void draw() {
  if (ready == true) {
    if (health > 0) {
      background(bg);
      txt.displayScore(player.score, health);

      if (keyUp) player.update (0, -2);
      if (keyDown) player.update (0, 2);
      if (keyLeft) player.update (-2, 0);
      if (keyRight) player.update (2, 0);

      player.update();
      player.walls();
      player.drawMe();
      shark.drawMe();
      shark.update();
      shark.walls();
      player.bite(shark);
      if (shark.alive == false) {
        shark = respawns();
      }//if

      for (int i = 0; i < eFishList.size(); i++) {
        Fish fishi = (Fish) fishList.get(i);
        EnemyFish eFishi = (EnemyFish) eFishList.get(i);
        if (player.headOn(eFishi) && player.collisionDetection(eFishi) && eFishi.alive == true && player.ready == true) {
          player.eat(eFishi);
          if (player.alive == false) {
            respawn();
            health --;
            println(health);
          }//if
        }//if
        if ( player.headOn(shark) && player.collisionDetection(shark) && shark.alive == true && shark.tailBites > 0 && player.ready == true) {
          player.eat(shark);
          if (player.alive == false) {
            respawn();
            health --;
            println(health);
          }//if
        }//if
        if (eFishi.alive == false) {
          eFishi.drawWaves();
        }//if 
        else {
          fishi.update();
          fishi.drawMe();
          eFishi.update();
          eFishi.walls();
          eFishi.drawMe();
        }//else

          for (int j = i+1; j < eFishList.size(); j++) {
          Fish fishj = (Fish) fishList.get(j);
          EnemyFish eFishj = (EnemyFish) eFishList.get(j);
          eFishi.collision(eFishj);
          shark.collision(eFishj);
        }//for j
      }//for i
    }//if health
    else {
      background (bg);
      txt.gameOver(player.score);
      if (restart == true) {
        draw();
      }//restart
    }//else health
  }//if ready
  else {
    background(bg);
    txt.startingScreen();
  }//else ready
}//draw

