// Importamos las librerías necesarias para la animación de GIF y el sonido
import gifAnimation.*;
import processing.sound.*;


Game game;

void setup() {
  size(1280,720);
   // Inicializamos la instancia del juego
  game = new Game(this);
}

void draw() {
  game.update();
  game.display();
}


void keyPressed() {
  // Manejamos la entrada del teclado
  game.handleKeyPress();
}
