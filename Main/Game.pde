class Game {
  PApplet parent; // Referencia al objeto PApplet principal
  Estado estadoActual; // Estado actual del juego
  LoadingScreen loadingScreen; // Pantalla de carga
  Cinematica cinematica; // Cinemática del juego
  Maze maze; // Laberinto del juego
  Player player; // Jugador
  SoundManager soundManager; // Gestor de sonidos
  Timer timer; // Temporizador del juego
  
  Game(PApplet parent) {
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal
    estadoActual = Estado.MOSTRANDO_IMAGEN1; // Estado inicial del juego
    loadingScreen = new LoadingScreen(parent); // Inicializa la pantalla de carga
    cinematica = new Cinematica(parent); // Inicializa la cinemática
    maze = new Maze(parent, this); // Inicializa el laberinto
    player = new Player(parent); // Inicializa el jugador
    soundManager = new SoundManager(parent); // Inicializa el gestor de sonidos
    timer = new Timer(parent, this); // Inicializa el temporizador
    
    player.setGame(this); // Establece la referencia al juego en el jugador
    
    soundManager.playMusicaCarga(); // Reproduce la música de carga
  }
  
 void update() {
    switch (estadoActual) {
        case MOSTRANDO_IMAGEN1:
        case MOSTRANDO_MENSAJE1:
        case MOSTRANDO_IMAGEN2:
        case MOSTRANDO_MENSAJE2:
            // No se necesita actualización para estos estados
            break;
        case CINEMATICA:
            break;
        case JUEGO:
            player.move(); // Mueve al jugador
            maze.checkPistasCollection(player); // Verifica la colección de pistas por el jugador
            maze.checkMazeCompletion(player); // Verifica si el jugador ha completado el laberinto
            timer.update(); // Actualiza el temporizador
            break;
        case FINAL1:
        case FINAL2:
        case FINAL3:
            if (!soundManager.currentFinalMusic.isPlaying()) { 
                soundManager.playFinalMusic(estadoActual); // Reproduce la música del final
            }
            break;
        default:
            // Maneja cualquier estado no esperado
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
        loadingScreen.display(estadoActual); // Muestra la pantalla de carga
        break;
      case CINEMATICA:
        cinematica.display(); // Muestra la cinemática
        break;
      case JUEGO:
        maze.display(); // Muestra el laberinto
        player.display(); // Muestra al jugador
        timer.display(); // Muestra el temporizador
        break;
      case FINAL1:
      case FINAL2:
      case FINAL3:
        displayFinal(); // Muestra el final del juego
        break;
    }
  }
  
  void handleKeyPress() {
    switch (estadoActual) {
      case MOSTRANDO_IMAGEN1:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_MENSAJE1; // Cambia al estado de mostrar el primer mensaje
        }
        break;
      case MOSTRANDO_MENSAJE1:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_IMAGEN2; // Cambia al estado de mostrar la segunda imagen
        }
        break;
      case MOSTRANDO_IMAGEN2:
        if (parent.key == PConstants.ENTER) {
          estadoActual = Estado.MOSTRANDO_MENSAJE2; // Cambia al estado de mostrar el segundo mensaje
        }
        break;
      case MOSTRANDO_MENSAJE2:
        if (parent.key == PConstants.ENTER) {
          soundManager.stopMusicaCarga(); // Detiene la música de carga
          soundManager.playMusicaCinematica(); // Reproduce la música de la cinemática
          estadoActual = Estado.CINEMATICA; // Cambia al estado de cinemática
        }
        break;
      case CINEMATICA:
        cinematica.handleKeyPress(); // Maneja la entrada de teclado durante la cinemática
        
        if (cinematica.isFinished()) {
          estadoActual = Estado.JUEGO; // Cambia al estado de juego
          soundManager.stopMusicaCinematica(); // Detiene la música de la cinemática
          soundManager.playGameMusic(); // Reproduce la música del juego
        }
        break;
      case JUEGO:
        player.handleKeyPress(); // Maneja la entrada de teclado durante el juego
        break;
    }
  }
  
  void displayFinal() {
    parent.background(0); // Establece el fondo a negro
    // Carga y muestra la imagen del final correspondiente
    PImage finalImage = parent.loadImage("final" + (estadoActual.ordinal() - Estado.FINAL1.ordinal() + 1) + ".png");
    parent.image(finalImage, 0, 0, parent.width, parent.height);
  }
}
