class Laberinto {
  ArrayList<Pared> paredes;
  int ancho, alto;

  Laberinto(int ancho, int alto) {
    this.ancho = ancho;
    this.alto = alto;
    paredes = new ArrayList<Pared>();
    generarLaberinto();
  }

  void generarLaberinto() {
    // Implementación de la generación del laberinto
    // Esto es un ejemplo simple, podrías usar un algoritmo más complejo
    for (int i = 0; i < 10; i++) {
      PVector pos = new PVector(random(ancho), random(alto));
      float w = random(20, 100);
      float h = random(20, 100);
      paredes.add(new Pared(pos, w, h));
    }
  }

  void display() {
    for (Pared pared : paredes) {
      pared.display();
    }
  }
}
