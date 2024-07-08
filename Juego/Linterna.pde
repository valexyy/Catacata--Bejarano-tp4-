class Linterna {
  int x, y, direccion;
  float angulo = PI / 4; // ángulo de la linterna
  float rango = 100; // rango de la linterna

  Linterna(int x, int y, int direccion) {
    this.x = x;
    this.y = y;
    this.direccion = direccion;
  }

  public void actualizar(int x, int y, int direccion) {
    this.x = x;
    this.y = y;
    this.direccion = direccion;
  }

  public void dibujar() {
    fill(255, 255, 0, 100);
    noStroke();
    beginShape();
    vertex(x, y);
    for (float a = -angulo / 2; a <= angulo / 2; a += 0.01) {
      float sx = x + cos(a + direccion * HALF_PI) * rango;
      float sy = y + sin(a + direccion * HALF_PI) * rango;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
