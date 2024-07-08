class Pista {
  float x, y;
  PImage imagen;

  Pista(float x, float y) {
    this.x = x;
    this.y = y;
    imagen = loadImage("ruta_a_tu_imagen.png");
  }

  void display() {
    image(imagen, x, y);
  }
}
