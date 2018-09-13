class Texts {
  PFont headFont;
  PFont overFont;
  Texts() {
    headFont = loadFont("myFont.vlw");
  }//constructor
  //heads up display
  void displayScore(int score, int lives) {
    textAlign(CENTER);
    strokeWeight(10);
    fill(255);
    textFont(headFont);
    text("Score: " + score, width/2, height - 20);
    text("Lives: " + lives, width - 100, height - 20);
  }//score
  void gameOver(int score) {
    textAlign(CENTER);
    strokeWeight(10);
    fill(255);
    background(0);
    textFont(headFont, 60);
    fill(255);
    text("GAME OVER", width/2, height/2);
    textFont(headFont, 20);
    text("Final Score: " + score, width/2, 
    height/2 + 30);
  }//gameOver
  void startingScreen () {
    textAlign(CENTER);
    strokeWeight(10);
    fill(255);
    textFont(headFont);
    text("Use WASD keys to move ", width/2, 200);
    text("Press R key to start the game", width/2, 400);
  }//startingScreen
}//class

