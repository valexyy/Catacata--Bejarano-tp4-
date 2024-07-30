class IntroScreen {
  PApplet parent;
  String message;
  int startTime;
  boolean isActive;
  int duration; // Duración en milisegundos

  IntroScreen(PApplet parent) {
    this.parent = parent;
    this.isActive = false;
    this.duration = 3000; // 3 segundos
  }

  void start(String message) {
    this.message = message;
    this.startTime = parent.millis();
    this.isActive = true;
  }

  void display() {
    if (isActive) {
      parent.background(0);
      parent.fill(255);
      parent.textAlign(PConstants.CENTER, PConstants.CENTER);
      parent.textSize(40);
      parent.text(message, parent.width / 2, parent.height / 2);
    }
  }

  void update() {
    if (isActive && parent.millis() - startTime > duration) {
      isActive = false;
    }
  }

  boolean isFinished() {
    return !isActive;
  }
}
