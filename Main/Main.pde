import gifAnimation.*;
import processing.sound.*;

Game game;

void setup() {
  size(1280,720);
  game = new Game(this);
  game.showingIntro = true;
  game.introScreen.start("1era Habitación");
}

void draw() {
  game.update();
  game.display();
}

void keyPressed() {
  game.handleKeyPress();
}
