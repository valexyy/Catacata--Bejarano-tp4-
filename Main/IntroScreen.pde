class IntroScreen {
  PApplet parent;
  String message;
  int startTime;
  boolean isActive;
  int duration;
//Contructor de la clase IntroScreen
//Inicializa la pantalla de introduccion
//@param parent La instancia de PApplet principal

  IntroScreen(PApplet parent) {
    this.parent = parent;
    this.isActive = false;
    this.duration = 3000;
  }

  void start(String message) {
    this.message = message;
    this.startTime = parent.millis();
    this.isActive = true;
    //Inicia la pantalla de introduccion con un mensaje especifico 
  }

  void display() {
    if (isActive) {
      parent.background(0);
      parent.fill(255);
      parent.textAlign(PConstants.CENTER, PConstants.CENTER);
      parent.textSize(40);
      parent.text(message, parent.width / 2, parent.height / 2);
      //Muestra la pantalla de introduccion 
    }
  }

  void update() {
    if (isActive && parent.millis() - startTime > duration) {
      isActive = false;
      //Actualiza el estado de la pantalla de introduccion
    }
  }

  boolean isFinished() {
    return !isActive;
    //Verifica si la pantalla de introduccion ha terminado
    //@return true si la pantalla de introduccion ha terminado, false en caso contrario
  }
}
