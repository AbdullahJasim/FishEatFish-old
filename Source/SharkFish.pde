class SharkFish extends EnemyFish {

  int tailOffSet;
  int tailBites;
  int flashTimer;
  int deadTimer;

  SharkFish() {
    super();
    tailOffSet = 140;
    tailBites = 4;
    flashTimer = -1;
    deadTimer = 400;
    alive = true;
    fishSize = 120;
    fColor = color (50, 50, 50);
  }//constructor

  void update() {
    if (tailBites > 0) {
      super.update();
    }//if

    if (flashTimer > 0) {
      flashTimer--;
      if (flashTimer%2 == 1) {
        fColor = color(255, 255, 255);
      }//if
      else {
        fColor = color (50, 50, 50);
      }//else
    } 
    else if (flashTimer == 0) {
      flashTimer--;
      dX *= -1;
      dY *= -1;
    }
    amp = 0;
    if (tailBites <= 0) {
      if (deadTimer > 0) {
        deadTimer --;
        y -= 2;
      }//if 
      else if (deadTimer <= 0) {
        alive = false;
      }//if
    }//if
  }//update


    void walls() {
    if (x > width + 250 ) {
      alive = false;
    }
    if (x < - 250) {
      alive = false;
    }
    if (y > height + 250) {
      alive = false;
    }
    if (y < - 250) {
      alive = false;
    }
  }//walls

  void drawMe() {
    if (tailBites > 0) {
      pushMatrix();
      translate(x, y);
      if (dX > 0) {
        scale (-2 * fSize, 2 * fSize);
      } 
      else {
        scale(fSize * 2);
      }
      stroke(0);
      strokeWeight(0.01 * fishSize);
      fill(fColor);
      ellipse (0, 0, 1. * fishSize, 0.5 * fishSize); //body
      noStroke();
      fill(255, 0, 0, 100);
      triangle (-0.2 * fishSize, 0.025 * fishSize, -0.325 * fishSize, 0.05 * fishSize, -0.225 * fishSize, 0.05 * fishSize); //eye
      fill(255);
      curve (0.5 * fishSize, 0, -0.25 * fishSize, -0.2125 * fishSize, 0, 0.125 * fishSize, 0, 0.50 * fishSize);
      curve (0.5 * fishSize, 0, -0.2 * fishSize, -0.225 * fishSize, 0.125 * fishSize, 0.125 * fishSize, 0, 0.50 * fishSize);
      curve (0.5 * fishSize, 0, -0.15 * fishSize, -0.2375 * fishSize, 0.25 * fishSize, 0.125 * fishSize, 0, 0.50 * fishSize); //markings
      fill(0);
      stroke(50, 0, 0);
      strokeWeight(0.01 * fishSize);
      curve(0, 0, -0.42 * fishSize, 0.125 * fishSize, -0.075 * fishSize, 0.245 * fishSize, -5.00 * fishSize, 2.50 * fishSize); //mouth
      fill(255);
      noStroke();
      triangle(-0.25 * fishSize, 0.10 * fishSize, -0.225 * fishSize, 0.15 * fishSize, -0.225 * fishSize, 0.095 * fishSize);
      triangle(-0.2 * fishSize, 0.0875 * fishSize, -0.15 * fishSize, 0.175 * fishSize, -0.175 * fishSize, 0.0825 * fishSize);
      triangle(-0.15 * fishSize, 0.08 * fishSize, -0.15 * fishSize, 0.10 * fishSize, -0.15 * fishSize, 0.0775 * fishSize);
      triangle(0.025 * fishSize, 0.195 * fishSize, 0, 0.2075 * fishSize, -0.10 * fishSize, 0.1325 * fishSize);
      triangle(0.15 * fishSize, 0.1125 * fishSize, 0.05 * fishSize, 0.1825 * fishSize, -0.05 * fishSize, 0.1075 * fishSize); //teeth
      fill(fColor);
      stroke(0);
      strokeWeight(0.01 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.50 * fishSize); //tail
      noStroke();
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.425 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.35 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.275 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.20 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.15 * fishSize);
      ellipse (0.63 * fishSize, 0, 0.25 * fishSize, 0.05 * fishSize);

      popMatrix();
    }//if
    else {
      pushMatrix();
      translate(x, y);
      strokeWeight(flashTimer+5);
      ellipse (0, 0, 100, 100);
      popMatrix();
    }//else
  }//drawMe
}//class

