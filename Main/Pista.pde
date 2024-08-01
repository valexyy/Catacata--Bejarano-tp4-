class Pista extends GameEntity {
  PImage image;
  int offsetX;
  int offsetY;
//Constructor de pista
//@param parent La instancia de PApplet principal
//@param x Posicion en el eje X
//@param y Posicion en el eje Y
//@param image Imagen de la pista 
  Pista(PApplet parent, int x, int y, PImage image) {
    super(parent, x, y);
    this.image = image;
    this.offsetX = (parent.width - 500) / 2;
    this.offsetY = (parent.height - 500) / 2;
  }

  @Override
  void display() {
    parent.image(image, x + offsetX, y + offsetY, 50 / 2.5, 50 / 2.5);
    //Muestra la pista en pantalla 
  }

  @Override
  void update() {
    //Actualiza el estado de la pista
  }

  boolean isColliding(Player player) {
    float distance = PApplet.dist(player.x + 25 + offsetX, player.y + 25 + offsetY, 
                                  x + 10 + offsetX, y + 10 + offsetY);
    return distance < 30;
    //Verifica si el jugador está colisionado con la pista
    //@param player El jugador a verificar
    //@param true si hay colision, false en caso contrario 
  }
}
