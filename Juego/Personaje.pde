class Personaje{
  private PVector posicion;
  private PVector velocidad;
  private PImage[] frames;
  private int direccion;
  
  public Personaje(){
    frames= new PImage[8];
    PImage spriteSheet= loadImage("personaje.png");
     int frameWidth = spriteSheet.width / 4;
    int frameHeight = spriteSheet.height / 2;
    
    for (int i = 0; i < 4; i++) {
      frames[i] = spriteSheet.get(i * frameWidth, 0, frameWidth, frameHeight);
    }
    
  }
  
  public void display(){
    image(frames[direccion], posicion.x, posicion.y, 40, 40);
  }
  /*mueve el atibuto posicion una cantidad determinado por velocidad
  direccion indica para donde se ira (0 arriba, 1 derecha, 2 abajo, 3 izq)*/
  public void mover(int direccion){
    this.direccion=direccion;
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
     // Limitar el movimiento dentro de la habitación
    if (nuevaPosicion.x < habitacion.posicion.x || nuevaPosicion.x + 60 > habitacion.posicion.x + 500 ||
        nuevaPosicion.y < habitacion.posicion.y || nuevaPosicion.y + 60 > habitacion.posicion.y + 400) {
      return;
    }
    
    if(!verificarColisiones(nuevaPosicion)){
      this.posicion=nuevaPosicion;
    }
  }
  
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public boolean verificarColisiones(PVector nuevaPosicion){
    for(Pared pared: paredes){
      if(pared != null && pared.colisionaCon(nuevaPosicion, 60)){
        return true;
      }
    }
    return false;
  }
  
  /*public void verificarColisiones(Pared[] paredes){
    for(Pared pared: paredes){
      if(pared !=null && pared.colisionaCon(this.posicion,60)){  
      }
    }
  }*/
}
