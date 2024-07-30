class Maze {
  PApplet parent;
  Game game;
  int[][] maze;
  int cellSize;
  ArrayList<PVector> pistas;
  PImage[] pistasImg;
  int currentMaze;

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
    pistas = new ArrayList<PVector>();
    pistasImg = new PImage[6];
    for (int i = 0; i < 6; i++) {
      pistasImg[i] = parent.loadImage("pista" + (i + 1) + ".png");
    }
    initializePistas();
  }

  void display() {
    parent.background(255);
    int offsetX = (parent.width - maze[0].length * cellSize) / 2;
    int offsetY = (parent.height - maze.length * cellSize) / 2;
    
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 1) {
          parent.fill(140, 157, 173);
        } else {
          parent.fill(96, 59, 42);
        }
        parent.rect(col * cellSize + offsetX, row * cellSize + offsetY, cellSize, cellSize);
      }
    }
    
    parent.fill(0, 0, 128, 127);
    parent.rect(0, 0, parent.width, parent.height);
    
    for (int i = 0; i < pistas.size(); i++) {
      PVector pista = pistas.get(i);
      parent.image(pistasImg[i], pista.x + offsetX, pista.y + offsetY, cellSize / 2, cellSize / 2);
    }
  }

  void checkPistasCollection(Player player) {
    int offsetX = (parent.width - maze[0].length * cellSize) / 2;
    int offsetY = (parent.height - maze.length * cellSize) / 2;
    
    for (int i = pistas.size() - 1; i >= 0; i--) {
      PVector pista = pistas.get(i);
      if (PApplet.dist(player.x + cellSize / 2 + offsetX, player.y + cellSize / 2 + offsetY,
                      pista.x + cellSize / 4 + offsetX, pista.y + cellSize / 4 + offsetY) < cellSize / 2) {
        pistas.remove(i);
        player.pistasRecolectadas++;
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
      }
    }
  }

  void initializePistas() {
    pistas.clear();
    ArrayList<PVector> validPositions = new ArrayList<PVector>();
    for (int row = 0; row < maze.length; row++) {
      for (int col = 0; col < maze[row].length; col++) {
        if (maze[row][col] == 0) {
          validPositions.add(new PVector(col * cellSize, row * cellSize));
        }
      }
    }
    int numPistas = 3;
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
