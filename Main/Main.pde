//Clase principal que inicializa y ejecuta el juego
import gifAnimation.*;
import processing.sound.*;

Game game;

void setup() {
  size(1280, 720);//Agrande la ventana para poder ver todo más claro.
  game = new Game(this);
  //Configura el entorno inicial del juego
}

void draw() {
  game.update();
  game.display();
  //Actualiza y dibuja el juego en cada frame
}

void keyPressed() {
  game.handleKeyPress();
  //Maneja las pulsaciones de teclas
}
