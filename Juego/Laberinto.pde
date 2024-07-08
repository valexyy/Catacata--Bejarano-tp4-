class Laberinto {
  Pared[] paredes;
  int ancho, alto;

  Laberinto(int ancho, int alto) {
    this.ancho = ancho;
    this.alto = alto;
    paredes = new Pared();
    generarLaberinto();
  }

  void generarLaberinto() {
    // Implementación de la generación del laberinto
    // Esto es un ejemplo simple, podrías usar un algoritmo más complejo
    for (int i = 0; i < 10; i++) {
      float x = random(ancho);
      float y = random(alto);
      float w = random(20, 100);
      float h = random(20, 100);
      paredes.add(new Pared(x, y, w, h));
    }
  }

  void display() {
    for (Pared pared : paredes) {
      pared.display();
    }
  }
}
