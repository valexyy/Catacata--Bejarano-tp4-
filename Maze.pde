class Maze {
  PApplet parent; // Referencia al objeto PApplet principal
  Game game; // Referencia al objeto Game
  int[][] maze; // Matriz que representa el laberinto
  int cellSize; // Tamaño de cada celda del laberinto
  ArrayList<PVector> pistas; // Lista de posiciones de las pistas
  PImage[] pistasImg; 
  int currentMaze; 

  Maze(PApplet parent, Game game) {
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal
    this.game = game; // Inicializa la referencia al objeto Game
    cellSize = 50; // Establece el tamaño de cada celda
    currentMaze = 0; 
    // Define el primer laberinto
    maze = new int[][]{
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
      {1, 0, 0, 0, 1, 0, 0, 0, 0, 1},
      {1, 0, 1, 0, 1, 0, 1, 1, 0, 1},
      {1, 0, 1, 0, 0, 0, 0, 1, 0, 1},
      {1, 0, 1, 1, 1, 1, 0, 1, 0, 1},
      {1, 0, 0, 0, 0, 1, 0, 1, 0, 1},
      {1, 0, 1, 1, 0, 1, 0, 0, 0, 1},
      {1, 0, 0, 1, 0, 1, 0, 0, 0, 1},
      {1, 1, 0, 1, 0, 0, 0, 1, 0, 1},
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    };
    pistas = new ArrayList<PVector>(); // Inicializa la lista de pistas
    pistasImg = new PImage[6]; // Inicializa el arreglo de imágenes de pistas
    // Carga las imágenes de las pistas
    for (int i = 0; i < 6; i++) {
      pistasImg[i] = parent.loadImage("pista" + (i + 1) + ".png");
    }
    initializePistas(); // Inicializa las posiciones de las pistas
  }

  void display() {
    parent.background(255); // Establece el fondo a blanco
    int offsetX = (parent.width - maze[0].length * cellSize) / 2; // Calcula el desplazamiento en X
    int offsetY = (parent.height - maze.length * cellSize) / 2; // Calcula el desplazamiento en Y
    
    // Dibuja el laberinto
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 1) {
          parent.fill(140, 157, 173); // Color para las paredes
        } else {
          parent.fill(96, 59, 42); // Color para los caminos
        }
        parent.rect(col * cellSize + offsetX, row * cellSize + offsetY, cellSize, cellSize); // Dibuja cada celda
      }
    }
    
    // Dibuja un rectángulo semitransparente sobre el laberinto
    parent.fill(0, 0, 128, 127);
    parent.rect(0, 0, parent.width, parent.height);
    
    // Dibuja las pistas
    for (int i = 0; i < pistas.size(); i++) {
      PVector pista = pistas.get(i);
      parent.image(pistasImg[i], pista.x + offsetX, pista.y + offsetY, cellSize / 2, cellSize / 2); // Muestra cada imagen de pista
    }
  }

  void checkPistasCollection(Player player) {
    int offsetX = (parent.width - maze[0].length * cellSize) / 2; // Calcula el desplazamiento en X
    int offsetY = (parent.height - maze.length * cellSize) / 2; // Calcula el desplazamiento en Y
    
    // Verifica si el jugador ha recolectado alguna pista
    for (int i = pistas.size() - 1; i >= 0; i--) {
      PVector pista = pistas.get(i);
      // Calcula la distancia entre el jugador y la pista
      if (PApplet.dist(player.x + cellSize / 2 + offsetX, player.y + cellSize / 2 + offsetY,
                      pista.x + cellSize / 4 + offsetX, pista.y + cellSize / 4 + offsetY) < cellSize / 2) {
        pistas.remove(i); // Elimina la pista de la lista
        player.pistasRecolectadas++; // Incrementa el contador de pistas recolectadas
      }
    }
  }

  void checkMazeCompletion(Player player) {
    // Verifica si el jugador ha llegado a la meta del laberinto
    if (player.x / cellSize == maze[0].length - 2 && player.y / cellSize == maze.length - 2) {
      if (currentMaze == 0) {
        // Cambia al siguiente laberinto
        maze = new int[][]{
          {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
          {1, 0, 1, 0, 0, 0, 0, 0, 0, 1},
          {1, 0, 1, 1, 1, 1, 1, 1, 0, 1},
          {1, 0, 0, 0, 0, 0, 0, 1, 0, 1},
          {1, 1, 1, 1, 1, 0, 0, 1, 0, 1},
          {1, 0, 0, 0, 0, 0, 0, 1, 0, 1},
          {1, 0, 1, 1, 0, 1, 0, 1, 0, 1},
          {1, 0, 1, 0, 0, 1, 0, 0, 0, 1},
          {1, 0, 0, 0, 1, 1, 1, 1, 0, 1},
          {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
        };
        player.x = 50; // Reinicia la posición del jugador
        player.y = 50;
        currentMaze = 1; // Actualiza el laberinto actual
        pistas.clear(); // Limpia la lista de pistas
        initializePistas(); // Inicializa nuevas pistas
      } else {
        // Finaliza el juego y determina el estado final
        if (player.pistasRecolectadas == 6) {
          game.estadoActual = Estado.FINAL3;
        } else if (player.pistasRecolectadas >= 3) {
          game.estadoActual = Estado.FINAL2;
        } else {
          game.estadoActual = Estado.FINAL1;
        }
        game.soundManager.stopGameMusic(); // Detiene la música del juego
        game.soundManager.playFinalMusic(game.estadoActual); // Reproduce la música del final correspondiente
      }
    }
  }

  void initializePistas() {
    pistas.clear(); // Limpia la lista de pistas
    ArrayList<PVector> validPositions = new ArrayList<PVector>(); // Lista de posiciones válidas para las pistas
    // Agrega las posiciones válidas del laberinto a la lista
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 0) {
          validPositions.add(new PVector(col * cellSize, row * cellSize));
        }
      }
    }
    int numPistas = 3; // Número de pistas a colocar
    // Coloca las pistas en posiciones aleatorias válidas
    for (int i = 0; i < numPistas; i++) {
      if (validPositions.size() > 0) {
        int index = (int)parent.random(validPositions.size());
        pistas.add(validPositions.remove(index));
      } else {
        System.out.println("No hay suficientes posiciones válidas para las pistas.");
        break;
      }
    }
  }
}
