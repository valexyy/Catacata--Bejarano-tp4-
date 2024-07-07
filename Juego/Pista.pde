class Pista{
  private PVector posicion;
  private PImage imagen;
  private boolean recolectada;
  
  public Pista(PVector posicion, String imagePath){
    this.posicion=posicion;
    this.imagen=loadImage(imagePath);
    this.recolectada=false;
  }
  
  public void display(){
    image(imagen, posicion.x, posicion.y, 50,50);
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public boolean isRecolectada(){
    return this.recolectada;
  }
  
  public void recolectar(){
    this.recolectada=true;
  }
}
