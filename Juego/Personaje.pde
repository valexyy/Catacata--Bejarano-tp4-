class Personaje {
  int x, y;
  PImage sprite;
  int direccion = 0; // 0: arriba, 1: derecha, 2: abajo, 3: izquierda
  int pistasRecogidas = 0;

  Personaje(int x, int y, PImage sprite) {
    this.x = x;
    this.y = y;
    this.sprite = sprite;
  }

  void mover(int dx, int dy) {
    x += dx;
    y += dy;
    if (dx > 0) direccion = 1;
    else if (dx < 0) direccion = 3;
    else if (dy > 0) direccion = 2;
    else if (dy < 0) direccion = 0;
  }

  void dibujar() {
    image(sprite, x, y, 40, 40);
  }

  boolean recogerPista(Pista pista) {
    // Detectar colisión basada en la superposición de las imágenes
    return x < pista.x + pista.imagen.width && x + sprite.width > pista.x &&
           y < pista.y + pista.imagen.height && y + sprite.height > pista.y;
  }
}
