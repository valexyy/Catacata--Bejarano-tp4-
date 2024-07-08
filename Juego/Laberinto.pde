class Laberinto {
  int cols, rows;
  int w, h;
  Celda[][] celdas;
  ArrayList<Celda> pila = new ArrayList<Celda>();
  ArrayList<Pista> pistas = new ArrayList<Pista>();
  PImage[] imagenesPistas;

  Laberinto(int x, int y, int w, int h, PImage[] imagenesPistas) {
    this.w = w / 20;
    this.h = h / 20;
    cols = w / this.w;
    rows = h / this.h;
    this.imagenesPistas = imagenesPistas;
    celdas = new Celda[cols][rows];

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        celdas[i][j] = new Celda(x + i * this.w, y + j * this.h, this.w, this.h);
      }
    }

    // Generar laberinto desde la celda inicial
    generarLaberinto(0, 0);
    generarPistas();
  }

  void generarLaberinto(int col, int row) {
    Celda actual = celdas[col][row];
    actual.visitada = true;
    pila.add(actual);

    while (!pila.isEmpty()) {
      actual = pila.get(pila.size() - 1);
      ArrayList<Celda> vecinos = obtenerVecinos(actual);

      if (!vecinos.isEmpty()) {
        Celda vecino = vecinos.get((int)random(vecinos.size()));
        eliminarPared(actual, vecino);
        vecino.visitada = true;
        pila.add(vecino);
      } else {
        pila.remove(pila.size() - 1);
      }
    }
  }

  ArrayList<Celda> obtenerVecinos(Celda celda) {
    ArrayList<Celda> vecinos = new ArrayList<Celda>();
    int col = (celda.x - celdas[0][0].x) / w;
    int row = (celda.y - celdas[0][0].y) / h;

    if (col > 0 && !celdas[col - 1][row].visitada) vecinos.add(celdas[col - 1][row]);
    if (col < cols - 1 && !celdas[col + 1][row].visitada) vecinos.add(celdas[col + 1][row]);
    if (row > 0 && !celdas[col][row - 1].visitada) vecinos.add(celdas[col][row - 1]);
    if (row < rows - 1 && !celdas[col][row + 1].visitada) vecinos.add(celdas[col][row + 1]);

    return vecinos;
  }

  void eliminarPared(Celda a, Celda b) {
    int dx = b.x - a.x;
    int dy = b.y - a.y;

    if (dx == w) {
      a.eliminarPared(1);
      b.eliminarPared(3);
    } else if (dx == -w) {
      a.eliminarPared(3);
      b.eliminarPared(1);
    } else if (dy == h) {
      a.eliminarPared(2);
      b.eliminarPared(0);
    } else if (dy == -h) {
      a.eliminarPared(0);
      b.eliminarPared(2);
    }
  }

  void generarPistas() {
    pistas.clear();
    for (int i = 0; i < 10; i++) { // Genera 10 pistas por ejemplo
      int col = (int)random(cols);
      int row = (int)random(rows);
      int x = celdas[col][row].x + w / 4; // Ajusta la posición para centrar la imagen
      int y = celdas[col][row].y + h / 4;
      PImage imagen = imagenesPistas[(int)random(imagenesPistas.length)];
      pistas.add(new Pista(x, y, imagen));
    }
  }

  void dibujar() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        celdas[i][j].dibujar();
      }
    }
    for (Pista pista : pistas) {
      pista.dibujar();
    }
  }

  void comprobarPistas(Personaje personaje) {
    for (int i = pistas.size() - 1; i >= 0; i--) {
      if (personaje.recogerPista(pistas.get(i))) {
        pistas.remove(i);
      }
    }
  }
}
