class Laberinto {
  int columnas, filas;
  int tamanoCelda;
  Celda[][] grid;
  Celda actual;
  ArrayList<Celda> stack = new ArrayList<Celda>();
  int contadorLaberintos = 0;
  color c;

  Laberinto(int x, int y, int w, int h, color c) {
    this.columnas = w / 40;
    this.filas = h / 40;
    this.tamanoCelda = 40;
    this.c = c;
    grid = new Celda[columnas][filas];

    for (int i = 0; i < columnas; i++) {
      for (int j = 0; j < filas; j++) {
        grid[i][j] = new Celda(i, j);
      }
    }
    actual = grid[0][0];
  }

  void dibujar() {
    for (int i = 0; i < columnas; i++) {
      for (int j = 0; j < filas; j++) {
        grid[i][j].dibujar(tamanoCelda, c);
      }
    }

    actual.visitado = true;
    Celda siguiente = actual.revisarVecinos(grid, columnas, filas);
    if (siguiente != null) {
      siguiente.visitado = true;
      stack.add(actual);
      eliminarParedes(actual, siguiente);
      actual = siguiente;
    } else if (stack.size() > 0) {
      actual = stack.remove(stack.size() - 1);
    }

    if (actual == grid[columnas - 1][filas - 1] && contadorLaberintos < 3) {
      contadorLaberintos++;
      generarNuevoLaberinto();
    }
  }

  void generarNuevoLaberinto() {
    for (int i = 0; i < columnas; i++) {
      for (int j = 0; j < filas; j++) {
        grid[i][j].visitado = false;
        grid[i][j].paredes = new boolean[]{true, true, true, true};
      }
    }
    actual = grid[0][0];
    stack.clear();
  }

  void eliminarParedes(Celda a, Celda b) {
    int x = a.i - b.i;
    if (x == 1) {
      a.paredes[3] = false;
      b.paredes[1] = false;
    } else if (x == -1) {
      a.paredes[1] = false;
      b.paredes[3] = false;
    }
    int y = a.j - b.j;
    if (y == 1) {
      a.paredes[0] = false;
      b.paredes[2] = false;
    } else if (y == -1) {
      a.paredes[2] = false;
      b.paredes[0] = false;
    }
  }
}
