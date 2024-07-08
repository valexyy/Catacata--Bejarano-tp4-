class Pista {
  int x, y;
  PImage imagen;

  Pista(int x, int y, PImage imagen) {
    this.x = x;
    this.y = y;
    this.imagen = imagen;
  }

  void dibujar() {
    image(imagen, x, y);
  }
}
