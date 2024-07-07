private class Habitacion{
  private PVector posicion;
  
  public Habitacion(PVector posicion){
    this.posicion=posicion;
  }
  
  public void dibujar(){
    fill(#F5ADAD);
    rect(posicion.x, posicion.y, 508, 450 );
  }
  
}
