class Personaje {
  float x, y;
  float velocidad = 2;
  PImage sprite;
  Linterna linterna;

  Personaje(float x, float y) {
    this.x = x;
    this.y = y;
    sprite = loadImage("personaje.png");
    linterna = new Linterna();
  }

  void mover() {
    if (keyPressed) {
      if (key == 'w') y -= velocidad;
      if (key == 's') y += velocidad;
      if (key == 'a') x -= velocidad;
      if (key == 'd') x += velocidad;
      // Agrega las direcciones diagonales si es necesario
    }
  }

  void display() {
    image(sprite, x, y);
    linterna.display(x, y);
  }

  void verificarColision(Laberinto laberinto) {
    for (Pared pared : laberinto.paredes) {
      if (x + sprite.width > pared.x && x < pared.x + pared.w &&
          y + sprite.height > pared.y && y < pared.y + pared.h) {
        // Revertir el movimiento si colisiona
        if (key == 'w') y += velocidad;
        if (key == 's') y -= velocidad;
        if (key == 'a') x += velocidad;
        if (key == 'd') x -= velocidad;
      }
    }
  }

  void recolectarPistas(Pista[] pistas) {
    for (int i = pistas.size() - 1; i >= 0; i--) {
      Pista pista = pistas.get(i);
      if (dist(x, y, pista.x, pista.y) < 20) { // Ajustar el rango de detección según el tamaño de la imagen
        pistas.remove(i);
      }
    }
  }
}
