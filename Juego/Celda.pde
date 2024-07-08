class Celda {
  int i, j;
  boolean[] paredes = {true, true, true, true};
  boolean visitado = false;

  Celda(int i, int j) {
    this.i = i;
    this.j = j;
  }

  void dibujar(int tamanoCelda, color c) {
    int x = i * tamanoCelda + 90;
    int y = j * tamanoCelda + 50;
    stroke(#000000);
    if (paredes[0]) line(x, y, x + tamanoCelda, y);
    if (paredes[1]) line(x + tamanoCelda, y, x + tamanoCelda, y + tamanoCelda);
    if (paredes[2]) line(x + tamanoCelda, y + tamanoCelda, x, y + tamanoCelda);
    if (paredes[3]) line(x, y + tamanoCelda, x, y);
    
    if (visitado) {
      noStroke();
      fill(c);
      rect(x, y, tamanoCelda, tamanoCelda);
    }
  }

  Celda revisarVecinos(Celda[][] grid, int columnas, int filas) {
    ArrayList<Celda> vecinos = new ArrayList<Celda>();

    if (i > 0 && !grid[i - 1][j].visitado) {
      vecinos.add(grid[i - 1][j]);
    }
    if (i < columnas - 1 && !grid[i + 1][j].visitado) {
      vecinos.add(grid[i + 1][j]);
    }
    if (j > 0 && !grid[i][j - 1].visitado) {
      vecinos.add(grid[i][j - 1]);
    }
    if (j < filas - 1 && !grid[i][j + 1].visitado) {
      vecinos.add(grid[i][j + 1]);
    }

    if (vecinos.size() > 0) {
      int r = int(random(vecinos.size()));
      return vecinos.get(r);
    } else {
      return null;
    }
  }
}
