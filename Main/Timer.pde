//Clase que maneja el temporizador del juego
class Timer {
  PApplet parent;
  Game game;
  int totalTime;
  int startTime;
  boolean timerRunning;
  PFont jellykaFont;
  
  //Constructor de Timer 
  //@param parent La instancia de PApplet principal
  //@param game La instancia del juego actual

  Timer(PApplet parent, Game game) { 
    this.parent = parent;
    this.game = game;
    totalTime = 80000; // 80 segundos
    startTime = parent.millis();
    timerRunning = true;
    jellykaFont = parent.createFont("Jellyka_Castles_Queen.ttf", 32);
  }

  void update() {
    if (timerRunning) {
      int currentTime = parent.millis();
      int elapsedTime = currentTime - startTime;
      int remainingTime = totalTime - elapsedTime;
      if (remainingTime <= 0) {
        remainingTime = 0;
        timerRunning = false;
        if (game.estadoActual == Estado.JUEGO) {
          game.estadoActual = Estado.FINAL1;
          game.soundManager.stopGameMusic();
          game.soundManager.playFinalMusic(game.estadoActual);
          //Actualiza el estado del temporizador
        }
      }
    }
  }

  void display() {
    if (timerRunning) {
      int currentTime = parent.millis();
      int elapsedTime = currentTime - startTime;
      int remainingTime = totalTime - elapsedTime;
      int seconds = remainingTime / 1000;
      parent.fill(255, 0, 0);
      parent.textFont(jellykaFont);
      parent.textSize(32);
      parent.textAlign(PConstants.RIGHT);
      parent.text("Él está cerca: " + seconds, parent.width - 10, 40);
      //Muestra el temporizador en pantalla 
    }
  }

  void resetTimer() {
    startTime = parent.millis();
    totalTime = 80000;
    timerRunning = true;
    //Reinicia el temporizador 
  }
}
