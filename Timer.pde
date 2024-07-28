class Timer {
  PApplet parent; // Referencia al objeto PApplet principal
  Game game; // Referencia a la instancia del juego
  int totalTime; // Tiempo total del temporizador en milisegundos
  int startTime; // Hora de inicio del temporizador
  boolean timerRunning; // Estado del temporizador
  PFont jellykaFont; // Fuente para el texto del temporizador

  Timer(PApplet parent, Game game) { 
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal
    this.game = game; // Inicializa la referencia a la instancia del juego
    totalTime = 80000; // Tiempo total en milisegundos (80 segundos)
    startTime = parent.millis(); // Hora actual en milisegundos
    timerRunning = true; // El temporizador comienza corriendo
    jellykaFont = parent.createFont("Jellyka_Castles_Queen.ttf", 32); 
  }

  void update() {
    if (timerRunning) { // Verifica si el temporizador está corriendo
      int currentTime = parent.millis(); // Hora actual en milisegundos
      int elapsedTime = currentTime - startTime; // Tiempo transcurrido desde el inicio
      int remainingTime = totalTime - elapsedTime; // Tiempo restante

      if (remainingTime <= 0) { // Si el tiempo restante es 0 o negativo
        remainingTime = 0; // Asegura que el tiempo restante sea 0
        timerRunning = false; // Detiene el temporizador
        if (game.estadoActual == Estado.JUEGO) { // Si el estado actual es JUEGO
          game.estadoActual = Estado.FINAL1; // Cambia el estado a FINAL1
          game.soundManager.stopGameMusic(); // Detiene la música del juego
          game.soundManager.playFinalMusic(game.estadoActual); // Reproduce la música del final
        }
      }
    }
  }

  void display() {
    if (timerRunning) { // Verifica si el temporizador está corriendo
      int currentTime = parent.millis(); // Hora actual en milisegundos
      int elapsedTime = currentTime - startTime; // Tiempo transcurrido desde el inicio
      int remainingTime = totalTime - elapsedTime; // Tiempo restante
      int seconds = remainingTime / 1000; // Convierte el tiempo restante a segundos

      parent.fill(255, 0, 0); 
      parent.textFont(jellykaFont); // Establece la fuente del texto
      parent.textSize(32); // Tamaño del texto
      parent.textAlign(PConstants.RIGHT); // Alineación del texto a la derecha
      parent.text("Él está cerca: " + seconds, parent.width - 10, 40); 
    }
  }
}
