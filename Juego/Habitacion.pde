class Habitacion {
  int x, y, w, h;
  
  Habitacion(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void dibujar() {
    rect(x, y, w, h);
  }
}
