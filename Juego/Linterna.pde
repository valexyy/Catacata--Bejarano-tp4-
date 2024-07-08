class Linterna {
  int x, y, direccion;
  float angulo = PI / 4; // ángulo de la linterna
  float rango = 100; // rango de la linterna

  Linterna(int x, int y, int direccion) {
    this.x = x;
    this.y = y;
    this.direccion = direccion;
  }

  void actualizar(int x, int y, int direccion) {
    this.x = x;
    this.y = y;
    this.direccion = direccion;
  }

  void dibujar() {
    noStroke();
    for (float r = 0; r < rango; r += 1) {
      float alpha = map(r, 0, rango, 100, 0);
      fill(255, 250, 0, alpha);
      beginShape();
      vertex(x, y);
      for (float a = -angulo / 2; a <= angulo / 2; a += 0.01) {
        float sx = x + cos(a + direccion * HALF_PI - PI / 2) * r;
        float sy = y + sin(a + direccion * HALF_PI - PI / 2) * r;
        vertex(sx, sy);
      }
      endShape(CLOSE);
    }
  }
}
