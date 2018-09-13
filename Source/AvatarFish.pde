class AvatarFish extends Fish {
  int score;
  int deathTimer;
  boolean ready;

  AvatarFish(float sx, float sy) {
    super();
    score = 0;
    x = sx;
    y = sy;
    fishSize = 30;
    fSize = 1; //sets initial fSize to 0.2, increases as fish eats other
    fColor = color (50, 150, 250);
    deathTimer = 100;
    ready = true;
  }//constructor
  void update() {
    super.update();
    x += dX;
    y += dY;
    dX *= 0.8;
    dY *= 0.8;
    wave = 0;
    amp = 0;
     if (ready == false) {
      deathTimer --;
    }//if
    if (deathTimer <= 1) {
      deathTimer = 100;
      ready = true;
    }//if
  }//update
  void update (float xDir, float yDir) {
    dX += xDir;
    dY += yDir;
  }//update
  boolean headOn (Fish other) {
    if (((dX > 0 && other.dX < 0) || (other.dX > 0 && dX < 0))) {
      return true;
    }//if
    return false;
  }//headOn

  void eat(EnemyFish other) {
    if (fishSize > other.fishSize) {
      if (fishSize < 90) {
        fishSize *= 1.05;
      }//if fishSize
      other.kill(eFishList);
      if (other.fishSize > 50) {
        score += 10;
      }
      else score+= 5;
    }//if
    else {
      ready = false;
      this.alive = false;
      fishSize = 30;
    }//else
  }//eat

  void bite(SharkFish other) {
    int dir = 0;
    if (dX > 0 && other.dX > 0) {
      dir = -1;
    }//if
    if (dX < 0 && other.dX < 0) {
      dir = 1;
    }//if
    if ( dir != 0 ) {
      if (  abs(x - other.x - dir*other.tailOffSet) < fishSize/2 + 20  &&  abs(y - other.y) < fishSize/2 + 40   &&   other.flashTimer < 0) {
        other.tailBites --;
        other.flashTimer = 40;
        if (other.tailBites <= 0) {
          score += 40;
          health++;
        }//if
      }//if
    }//if dir
  }//bite

  void walls() {
    if (x > width) {
      x = width;
      dX *= -1;
    }
    if (x < 0) {
      x = 0;
      dX *= -1;
    }
    if (y > height) {
      y = height;
      dY *= -1;
    }
    if (y < 0) {
      y = 0;
      dY *= -1;
    }
  }//walls

  void drawMe() {
    if (alive) {
        pushMatrix();
        translate(x, y);
        if (dX > 0) {
          scale (-fSize, fSize);
        }//if 
        else {
          scale(fSize);
        }//else
        noStroke();
        fill(150, 0, 0, 64);
        ellipse(1.4 * (fishSize), 0, 0.8 * (fishSize), 0.25 * (fishSize));
        ellipse(1.45 * (fishSize), 0, 0.9 * (fishSize), 0.35 * (fishSize));
        ellipse(1.5 * (fishSize), 0, 1.0 * (fishSize), 0.45 * (fishSize));
        ellipse(1.55 * (fishSize), 0, 1.1  * (fishSize), 0.55 * (fishSize));
        ellipse(1.6 * (fishSize), 0, 1.2  * (fishSize), 0.65 * (fishSize)); //Tail

        curve(0, 10 * (fishSize), (fishSize), 0, -0.98 * (fishSize), 0, 2.5 * (fishSize), 0);
        curve(0, 12 * (fishSize), (fishSize), 0, -0.98 * (fishSize), 0, 2.5 * (fishSize), 0);
        curve(0, 14 * (fishSize), (fishSize), 0, -0.98 * (fishSize), 0, 2.5 * (fishSize), 0);
        curve(0, 16 * (fishSize), (fishSize), 0, -0.98 * (fishSize), 0, 2.5 * (fishSize), 0); //upper fin

        curve(0, -8 * (fishSize), (fishSize), 0, -(fishSize), 0, -2 * (fishSize), -8 * (fishSize));
        curve(0, -10 * (fishSize), (fishSize), 0, -(fishSize), 0, -2 * (fishSize), -8 * (fishSize));
        curve(0, -12 * (fishSize), (fishSize), 0, -(fishSize), 0, -2 * (fishSize), -8 * (fishSize));
        curve(0, -14 * (fishSize), (fishSize), 0, -(fishSize), 0, -2 * (fishSize), -8 * (fishSize)); //lower fin

        stroke(0);
        strokeWeight(2);
        fill(fColor);
        if (deathTimer%2 == 1) {
        fill (255);
        } 
        ellipse(0, 0, 2.00 * (fishSize), (fishSize)); //body

        noStroke();
        fill(255, 255, 255, 150);
        ellipse(0.4 * (fishSize), 0.25 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(0.5 * (fishSize), 0.10 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(0.5 * (fishSize), -0.20 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(0.7 * (fishSize), 0.10 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(0, 0, 0.05 * (fishSize), 0.05* (fishSize));
        ellipse(-0.4 * (fishSize), 0.22 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(-0.3 * (fishSize), -0.05 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
        ellipse(-0.2 * (fishSize), -0.30 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize)); //dots

        fill(0, 150, 50, 150);
        ellipse(-0.70 * (fishSize), 0, 0.60 * (fishSize), 0.52 * (fishSize)); //head

        fill(255);
        strokeWeight(1);
        stroke(0);
        ellipse(-0.9 * (fishSize), 0.1 * (fishSize), 0.03 * (fishSize), 0.03 * (fishSize));
        noFill();
        curve(-2.00 * (fishSize), 0, -0.9 * (fishSize), 0.20 * (fishSize), -0.8 * (fishSize), 0, -(fishSize), (fishSize)); //face
        popMatrix();
    }//if
  }//drawMe
}//class

