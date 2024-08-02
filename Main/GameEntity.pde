//Clase abstracta que representa una entidad en el juego
abstract class GameEntity {
  protected PApplet parent;
  protected int x, y;

  GameEntity(PApplet parent, int x, int y) {
    this.parent = parent;
    this.x = x;
    this.y = y;
    //Constructor de GameEntity
    //@param parent La instancia de PApplet principal
    //@param x Posicion inicial en el eje X
    //@param y Posicion inicial en el eje Y
  }

  abstract void display();
  //Metodo abstracto para mostrar la entidad en pantalla
  abstract void update();
  //Metodo abstracto para actualizar el estado de la entidad 
}
