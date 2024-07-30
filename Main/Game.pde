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
  
  Game(PApplet parent) {
    this.parent = parent;
    estadoActual = Estado.MOSTRANDO_IMAGEN1;
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
        player.move();
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
          player.display();
          timer.display();
        }
        break;
      case FINAL1:
      case FINAL2:
      case FINAL3:
        displayFinal();
        break;
    }
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
        }
        break;
      case CINEMATICA:
        cinematica.handleKeyPress();
        if (cinematica.isFinished()) {
          estadoActual = Estado.JUEGO;
          soundManager.stopMusicaCinematica();
          soundManager.playGameMusic();
        }
        break;
      case JUEGO:
        player.handleKeyPress();
        break;
    }
  }
  
  void displayFinal() {
  parent.background(0);
  PImage finalImage = parent.loadImage("final" + (estadoActual.ordinal() - Estado.FINAL1.ordinal() + 1) + ".png");
  parent.image(finalImage, 0, 0, parent.width, parent.height);
}

}
