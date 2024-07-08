class Personaje {
  int x, y, ancho, alto;
  PImage[][] sprites;
  PImage spriteSheet;
  int direccion = 0;
  int frame = 0;
  int frameRate = 10;
  int frameCounter = 0;

  Personaje(int x, int y, int ancho, int alto, PImage[][] sprites) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.sprites = sprites;
  }

  void dibujar() {
    image(sprites[direccion][frame], x, y, ancho, alto);
    frameCounter++;
    if (frameCounter >= frameRate) {
      frame = (frame + 1) % 4;
      frameCounter = 0;
    }
  }

  void mover(int dx, int dy, Celda[][] grid) {
    int nuevaX = x + dx * 2;
    int nuevaY = y + dy * 2;
    int i = (nuevaX - 90) / ancho;
    int j = (nuevaY - 50) / alto;

    if (i >= 0 && i < grid.length && j >= 0 && j < grid[0].length) {
      Celda celda = grid[i][j];
      if (!colisiona(celda, dx, dy)) {
        x = nuevaX;
        y = nuevaY;
        direccion = obtenerDireccion(dx, dy);
      }
    }
  }

  boolean colisiona(Celda celda, int dx, int dy) {
    if (dx == 1 && celda.paredes[1]) return true;
    if (dx == -1 && celda.paredes[3]) return true;
    if (dy == 1 && celda.paredes[2]) return true;
    if (dy == -1 && celda.paredes[0]) return true;
    return false;
  }

  int obtenerDireccion(int dx, int dy) {
    if (dx == 1 && dy == 0) return 2;  // Derecha
    if (dx == -1 && dy == 0) return 1;  // Izquierda
    if (dy == 1 && dx == 0) return 3;  // Abajo
    if (dy == -1 && dx == 0) return 0;  // Arriba
    return direccion;
  }
}
