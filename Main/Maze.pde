class Maze {
  PApplet parent;
  Game game;
  int[][] maze;
  int cellSize;
  ArrayList<Pista> pistas;
  PImage[] pistasImg;
  int currentMaze;
  color wallColor1, floorColor1;
  color wallColor2, floorColor2;
//Constructor de la clase Maze
//Inicializa el laberinto y las pistas
//@param parent La instancia de PApplet principal
//@param game La instancia del juego actual 

  Maze(PApplet parent, Game game) {
    this.parent = parent;
    this.game = game;
    cellSize = 50;
    currentMaze = 0;
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
    //Dibuja el laberinto en la pantalla
    
    pistas = new ArrayList<Pista>();
    pistasImg = new PImage[6];
    for (int i = 0; i < 6; i++) {
      pistasImg[i] = parent.loadImage("pista" + (i + 1) + ".png");
    }
    initializePistas();
    
    wallColor1 = parent.color(255, 230, 238);
    floorColor1 = parent.color(255, 179, 204);
    wallColor2 = parent.color(140, 157, 173);
    floorColor2 = parent.color(96, 59, 42);
  }

  void display() {
    parent.background(255);
    int offsetX = (parent.width - maze[0].length * cellSize) / 2;
    int offsetY = (parent.height - maze.length * cellSize) / 2;
    
    color currentWallColor = (currentMaze == 0) ? wallColor1 : wallColor2;
    color currentFloorColor = (currentMaze == 0) ? floorColor1 : floorColor2;
    
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 1) {
          parent.fill(currentWallColor);
        } else {
          parent.fill(currentFloorColor);
        }
        parent.rect(col * cellSize + offsetX, row * cellSize + offsetY, cellSize, cellSize);
      }
    }
    
    parent.fill(0, 0, 128, 127);
    parent.rect(0, 0, parent.width, parent.height);
    
    for (Pista pista : pistas) {
      pista.display();
    }
  }

  void checkPistasCollection(Player player) {
    int offsetX = (parent.width - maze[0].length * cellSize) / 2;
    int offsetY = (parent.height - maze.length * cellSize) / 2;
    
    for (int i = pistas.size() - 1; i >= 0; i--) {
      Pista pista = pistas.get(i);
      if (PApplet.dist(player.x + cellSize / 2 + offsetX, player.y + cellSize / 2 + offsetY,
                      pista.x + cellSize / 4 + offsetX, pista.y + cellSize / 4 + offsetY) < cellSize / 2) {
        pistas.remove(i);
        game.entities.remove(pista);
        player.pistasRecolectadas++;
        //Verifica si el jugador ha recogido alguna pista
        //@param player El jugador actual
      }
    }
  }

  void checkMazeCompletion(Player player) {
    if (player.x / cellSize == maze[0].length - 2 && player.y / cellSize == maze.length - 2) {
      if (currentMaze == 0) {
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
        player.x = 50;
        player.y = 50;
        currentMaze = 1;
        pistas.clear();
        initializePistas();
        game.showingIntro = true;
        game.introScreen.start("2da Habitación");
      } else {
        if (player.pistasRecolectadas == 6) {
          game.estadoActual = Estado.FINAL3;
        } else if (player.pistasRecolectadas >= 3) {
          game.estadoActual = Estado.FINAL2;
        } else {
          game.estadoActual = Estado.FINAL1;
        }
        game.soundManager.stopGameMusic();
        game.soundManager.playFinalMusic(game.estadoActual);
        //Verifica si el jugador ha completado el laberinto actual
        //@param player El jugador actual
      }
    }
  }

  void initializePistas() {
    pistas.clear();
    if (game != null && game.entities != null) {
    game.entities.removeAll(pistas);
}
    ArrayList<PVector> validPositions = new ArrayList<PVector>();
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 0) {
          validPositions.add(new PVector(col * cellSize, row * cellSize));
        }
      }
    }
    int numPistas = 3; // Siempre 3 pistas por laberinto
    for (int i = 0; i < numPistas; i++) {
      if (validPositions.size() > 0) {
        int index = (int)parent.random(validPositions.size());
        PVector pos = validPositions.remove(index);
        Pista newPista = new Pista(parent, (int)pos.x, (int)pos.y, pistasImg[i + (currentMaze * 3)]);
        pistas.add(newPista);
        if (game != null && game.entities != null) {
          game.entities.add(newPista);
        } else {
          System.out.println("Error: game or game.entities is null");
        }
      } else {
        System.out.println("No hay suficientes posiciones válidas para las pistas.");
        break;
        //Inicializa las pistas en el laberinto
      }
    }
  }
}
