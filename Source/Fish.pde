class Fish {
  float x, y, dX, dY, fSize, wave, waveSpeed, amp, fishSize, shooting;
  color fColor;
  boolean alive;
  int traceTimer;

  Fish() {
    dY = 0;
    fColor = color (random(255), random(255), 0);
    fSize = 1; //sets initial size of other fish to this value
    alive = true;
    wave = random (2*PI);
    waveSpeed = random (0.1, 0.4);
    fishSize = random(10, 80);
    amp = random(1, 3);
  }//constructor

  void update() {
    wave += waveSpeed;
    x += dX;
    y += dY + sin(wave)*amp;
  }//update

  boolean collisionDetection(Fish other) {
    if (dist(x/2, y, (other.x)/2, other.y) < (fishSize/2 + other.fishSize/2)) {
      return true;
    }
    return false;
  }//collision detection

  void drawMe() {
  }//drawMe
}//Fish

