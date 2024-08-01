class Game {
  PApplet parent;
  Estado estadoActual;
  LoadingScreen loadingScreen;
  Cinematica cinematica;
  Maze maze;
  Player player;
  SoundManager soundManager;
  Timer timer;
  IntroScreen introScreen;
  boolean showingIntro;
  ArrayList<GameEntity> entities;
//Constructor de la clase Game
//Inicializa todos los componentes del juego
//@param parent La instancia de PApplet principal
  Game(PApplet parent) {
    this.parent = parent;
    estadoActual = Estado.MOSTRANDO_IMAGEN1;
    entities = new ArrayList<GameEntity>();
    loadingScreen = new LoadingScreen(parent);
    cinematica = new Cinematica(parent);
    maze = new Maze(parent, this);
    player = new Player(parent);
    soundManager = new SoundManager(parent);
    timer = new Timer(parent, this);
    player.setGame(this);
    soundManager.playMusicaCarga();
    introScreen = new IntroScreen(parent);
    showingIntro = false;
    
    entities = new ArrayList<GameEntity>();
    entities.add(player);
    entities.addAll(maze.pistas);
    //Actualiza el estado del juego en cada frame
  }

  void update() {
    switch (estadoActual) {
      case MOSTRANDO_IMAGEN1:
      case MOSTRANDO_MENSAJE1:
      case MOSTRANDO_IMAGEN2:
      case MOSTRANDO_MENSAJE2:
        break;
      case CINEMATICA:
        break;
      case JUEGO:
        if (showingIntro) {
          introScreen.update();
          if (introScreen.isFinished()) {
            showingIntro = false;
          }
        } else {
          for (GameEntity entity : entities) {
            entity.update();
          }
          maze.checkPistasCollection(player);
          maze.checkMazeCompletion(player);
          timer.update();
        }
        break;
      case FINAL1:
      case FINAL2:
      case FINAL3:
        if (!soundManager.currentFinalMusic.isPlaying()) {
          soundManager.playFinalMusic(estadoActual);
        }
        break;
      default:
        System.out.println("Estado no manejado: " + estadoActual);
        break;
        //Actualiza el estado del juego en cada frame 
    }
  }

  void display() {
    switch (estadoActual) {
      case MOSTRANDO_IMAGEN1:
      case MOSTRANDO_MENSAJE1:
      case MOSTRANDO_IMAGEN2:
      case MOSTRANDO_MENSAJE2:
        loadingScreen.display(estadoActual);
        break;
      case CINEMATICA:
        cinematica.display();
        break;
      case JUEGO:
        if (showingIntro) {
          introScreen.display();
        } else {
          maze.display();
          for (GameEntity entity : entities) {
            entity.display();
          }
          timer.display();
        }
        break;
      case FINAL1:
      case FINAL2:
      case FINAL3:
        displayFinal();
        break;
        //Dibuja los elementos del juego en la pantalla
    }
  }

  void startSecondIntro() {
    showingIntro = true;
    introScreen.start("2da Habitacion");
  }

  void handleKeyPress() {
    switch (estadoActual) {
      case MOSTRANDO_IMAGEN1:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_MENSAJE1;
        }
        break;
      case MOSTRANDO_MENSAJE1:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_IMAGEN2;
        }
        break;
      case MOSTRANDO_IMAGEN2:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_MENSAJE2;
        }
        break;
      case MOSTRANDO_MENSAJE2:
        if (parent.key == PConstants.ENTER) {
          soundManager.stopMusicaCarga();
          soundManager.playMusicaCinematica();
          estadoActual = Estado.CINEMATICA;
          cinematica.reset();
        }
        break;
      case CINEMATICA:
        cinematica.handleKeyPress();
        if (cinematica.isFinished()) {
          soundManager.stopMusicaCinematica();
          soundManager.playGameMusic();
          showingIntro = true;
          introScreen.start("1era Habitacion");
          estadoActual = Estado.JUEGO;
        }
        break;
      case JUEGO:
        // La lógica de manejo de teclas para el jugador ahora está en Player.move()
        break;
      case FINAL1:
      case FINAL2:
      case FINAL3:
        if (parent.key == PConstants.ENTER) {
          resetGame();
        }
        break;
        //Maneja las pulsaciones del usuario
    }
  }
  
  void displayFinal() {
    parent.background(0);
    PImage finalImage = parent.loadImage("final" + (estadoActual.ordinal() - Estado.FINAL1.ordinal() + 1) + ".png");
    parent.image(finalImage, 0, 0, parent.width, parent.height);
  }

  void resetGame() {
    estadoActual = Estado.MOSTRANDO_IMAGEN1;
    player = new Player(parent);
    player.setGame(this);
    maze = new Maze(parent, this);
    cinematica = new Cinematica(parent);
    timer = new Timer(parent, this);
    loadingScreen = new LoadingScreen(parent);
    introScreen = new IntroScreen(parent);
    
    entities.clear();
    entities.add(player);
    entities.addAll(maze.pistas);
    
    player.x = 50;
    player.y = 50;
    player.pistasRecolectadas = 0;
    maze.currentMaze = 0;
    timer.resetTimer();
    soundManager.stopAllMusic();
    soundManager.playMusicaCarga();
    showingIntro = false;
    //Reinicia el juego a su estado inicial
  }
}
