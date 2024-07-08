class Habitacion {
  Laberinto laberinto;
  Pista[] pistas;
  int ancho, alto;

  Habitacion(int ancho, int alto) {
    this.ancho = ancho;
    this.alto = alto;
    laberinto = new Laberinto(ancho, alto);
    pistas = new Pista();
    generarPistas(10); // Generamos 10 pistas por ejemplo
  }

  void generarPistas(int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      Pista pista = new Pista(random(ancho), random(alto));
      pistas.add(pista);
    }
  }

  void display() {
    laberinto.display();
    for (Pista pista : pistas) {
      pista.display();
    }
  }
}
