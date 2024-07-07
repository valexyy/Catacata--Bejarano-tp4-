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
    fill(#D37575);
    rect(posicion.x, posicion.y, ancho, alto);
  }
  
  boolean seSuperpone(Pared otra) {
    if(otra==null){
      return false;
    }
    return !(posicion.x + ancho < otra.posicion.x || 
             posicion.x > otra.posicion.x + otra.ancho || 
             posicion.y + alto < otra.posicion.y || 
             posicion.y > otra.posicion.y + otra.alto);
  }
  
  boolean colisionaCon(PVector pos, float tam){ 
    return !(pos.x + tam < posicion.x || pos.x > posicion.x + ancho || pos.y + tam < posicion.y || pos.y > posicion.y + alto);
  } 
  }
  
