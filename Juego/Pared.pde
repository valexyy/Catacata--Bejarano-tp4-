class Pared{
  private PVector posicion;
  private float ancho, alto;
  Pared otra;
  
    public Pared(PVector posicion, float ancho, float alto){
    this.posicion=posicion;
    this.ancho=ancho;
    this.alto=alto;
  }
  
  public void display(){
    fill(#C16565);
    rect(posicion.x, posicion.y, alto, ancho);
  } 
  
  boolean seSuperpone(Pared otra){
    if(otra== null){
      return false;
    }
    
     return !(posicion.x + ancho < otra.posicion.x || 
             posicion.x > otra.posicion.x + otra.ancho || 
             posicion.y + alto < otra.posicion.y || 
             posicion.y > otra.posicion.y + otra.alto);
    
  }
}
