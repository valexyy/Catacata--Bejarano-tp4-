class Personaje{
  private PVector posicion;
  private PVector velocidad;
  private PImage prota;
  
  public Personaje(){
    prota= loadImage("personaje.png");
  }
  
  public void display(){
    image(prota, posicion.x, posicion.y, 60, 60);
  }
  /*mueve el atibuto posicion una cantidad determinado por velocidad
  direccion indica para donde se ira (0 arriba, 1 derecha, 2 abajo, 3 izq)*/
  public void mover(int direccion){
    PVector nuevaPosicion=posicion.copy();
    switch(direccion){
      case 0:{
        nuevaPosicion.y-=this.velocidad.y;
        break;
      }
       case 1:{
        nuevaPosicion.x+=this.velocidad.x;
        break;
      }
       case 2:{
        nuevaPosicion.y+=this.velocidad.y;
        break;
      }
       case 3:{
        nuevaPosicion.x-=this.velocidad.x;
        break;
      }
    }
    
    if(!verificarColsiones(PVector(nuevaPosicion))){
      this.posicion=nuevaPosicion;
    }
  }
  
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
  
  public boolean verificarColisiones(PVector nuevaPosicion){
    for(Pared pared: paredes){
      if(pared != null && pared.colisionaCon(nuevaPosicion, 60)){
        return true;
      }
    }
    return false;
  }
  
  public void verifivarColisiones(Pared[] paredes){
    for(Pared pared: paredes){
      if(pared !=null && pared.colisionaCon(this.posicion,60)){  
      }
    }
  }
}
