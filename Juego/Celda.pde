class Celda {
  int x, y, w, h;
  boolean[] paredes = {true, true, true, true}; // top, right, bottom, left
  boolean visitada = false;

  Celda(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void dibujar() {
    stroke(255);
    if (paredes[0]) line(x, y, x + w, y); // top
    if (paredes[1]) line(x + w, y, x + w, y + h); // right
    if (paredes[2]) line(x + w, y + h, x, y + h); // bottom
    if (paredes[3]) line(x, y + h, x, y); // left
  }

  void eliminarPared(int dir) {
    paredes[dir] = false;
  }
}
