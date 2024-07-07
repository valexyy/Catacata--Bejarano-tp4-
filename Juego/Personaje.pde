class Personaje{
  private PVector posicion;
  private PVector velocidad;
  private PImage prota;
  
  public Personaje(){
    prota= loadImage("personaje.png");
  }
  
  public void display(){
    image(prota, posicion.x, posicion.y, 40, 40);
  }
  
  public void mover(){
  }
  
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  }
}
