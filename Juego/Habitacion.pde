class Habitacion {
  int x, y, w, h;
  Laberinto laberinto;

  Habitacion(int x, int y, int w, int h, PImage[] imagenesPistas) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    laberinto = new Laberinto(x, y, w, h, imagenesPistas);
  }

  void dibujar() {
    fill(#D65959);
    rect(x, y, w, h);
    stroke(255);
    noFill();
    laberinto.dibujar();
  }
}
