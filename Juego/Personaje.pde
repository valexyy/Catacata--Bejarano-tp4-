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
  /*mueve el atibuto posicion una cantidad determinado por velocidad
  direccion indica para donde se ira (0 arriba, 1 derecha, 2 abajo, 3 izq)*/
  public void mover(int direccion){
    switch(direccion){
      case 0:{
        this.posicion.y-=this.velocidad.y;
        break;
      }
       case 1:{
        this.posicion.x+=this.velocidad.x;
        break;
      }
       case 2:{
        this.posicion.y+=this.velocidad.y;
        break;
      }
       case 3:{
        this.posicion.x-=this.velocidad.x;
        break;
      }
    }
  }
  
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  }
  
  public void setVelocidad(PVector velocidad){
    this.velocidad=velocidad;
  }
}
