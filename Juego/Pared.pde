class Pared{
  private PVector posicion;
  private float ancho, alto;
  
  public Pared(PVector posicion, float ancho, float alto){
    this.posicion=posicion;
    this.ancho=ancho;
    this.alto=alto;
  }
  
  public void display(){
    fill(#F28484);
    rect(posicion.x, posicion.y, alto, ancho);
  } 
}
