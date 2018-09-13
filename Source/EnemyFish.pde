class EnemyFish extends Fish {
  EnemyFish() {
    super();
    shooting = random(2);
    if (shooting > 1) {
      x = random(-50, -150);
      dX = random (1, 3);
    } 
    else {
      x = random (1330, 1430);
      dX = random(-3, -1);
    }
    y = random(height);
    traceTimer = 30;
  }//constructor

  void update() {
    super.update();
  }//update

    void kill (ArrayList eFishList) {
    this.alive = false;
  }//kill

  void drawWaves() {
    if (traceTimer > 0) {
      traceTimer --;
      y -= 5;
      strokeWeight(2);
      noFill();
      stroke(fColor);
      ellipse(x, y, 3 * traceTimer, 3 * traceTimer);
    }//if
    else {
      eFishList.remove(this);
      fishList.add (new Fish());
      eFishList.add (new EnemyFish());
    }//else
  }//waves

  void walls() {
    if (x>width + 200) {
      this.kill(eFishList);
    }
    if (x<(-200)) {
      this.kill(eFishList);
    }
    if (y>height + 200) {
      this.kill(eFishList);
    }
    if (y < (-200)) {
      this.kill(eFishList);
    }
  }//walls

  void collision(EnemyFish other) { //collision is messed up, fix it by using old code
    if (dist(x/2, y, (other.x)/2, other.y) < (fishSize/2 + other.fishSize/2) && alive == true && other.alive == true) {
      float angle = atan2 (y - other.y, x - other.x);
      dX = random(3, -3)*cos(angle);
      dY = random(3, -3)*sin(angle);
      other.dX = (random(3, -3)) * cos (angle-PI);
      other.dY = (random(3, -3)) * sin (angle-PI);
    }//if
  }//collision

  void drawMe() {
    pushMatrix();
    translate(x, y);
    if (dX > 0) {
      scale (-fSize, fSize);
    } 
    else {
      scale(fSize);
    }
    super.drawMe();
    noStroke();
    fill(0, 50, 100, 100);
    curve(0, 0, 0.8 * (fishSize), 0, 1.4 * (fishSize), 0.4 * (fishSize), 4 * (fishSize), -2 * (fishSize));
    curve(0, 0, 0.8 * (fishSize), 0, 1.4 * (fishSize), 0.40* (fishSize), 8 * (fishSize), -3 * (fishSize));
    curve(0, 0, 0.8 * (fishSize), 0, 1.4 * (fishSize), -0.4 * (fishSize), 4 * (fishSize), 2 * (fishSize));
    curve(0, 0, 0.8 * (fishSize), 0, 1.4 * (fishSize), -0.4 * (fishSize), 8 * (fishSize), 4 * (fishSize)); //tail

    fill(0, 0, 255, 100);
    curve(0, 16 * (fishSize), 0.78 * (fishSize), 0, -0.98 * (fishSize), 0, 2.5 * (fishSize), 0); //upper fin

    curve(0, -14 * (fishSize), 0.78 * (fishSize), 0, -1.02 * (fishSize), 0, -2 * (fishSize), -8 * (fishSize)); //lower fin

    stroke(0);
    strokeWeight(0.02 * (fishSize));
    fill(fColor);
    ellipse(0, 0, 2.00 * (fishSize), (fishSize)); //body

    fill(255, 255, 255, 150);
    noStroke();
    ellipse(-0.70 * (fishSize), 0, 0.60 * (fishSize), 0.52 * (fishSize)); //head

    fill(0);
    strokeWeight(0.01 * (fishSize));
    stroke(0);
    ellipse(-0.9 * (fishSize), 0.07 * (fishSize), 0.05 * (fishSize), 0.05 * (fishSize));
    strokeWeight(0.03 * (fishSize));
    line(-0.95* (fishSize), 0.05* (fishSize), -0.70* (fishSize), -0.05* (fishSize));
    noFill();
    curve(-2.00 * (fishSize), 0, -0.9 * (fishSize), 0.2 * (fishSize), -0.8 * (fishSize), 0.10 * (fishSize), -(fishSize), (fishSize)); //face

      //    strokeWeight(10);
    //    stroke(0);
    //    ellipse(0, 0, 2*fishSize, fishSize); //testing

    popMatrix();
  }//drawMe
}//class

