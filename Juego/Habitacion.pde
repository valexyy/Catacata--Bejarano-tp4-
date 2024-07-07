private class Habitacion{
  private PVector posicion;
  private int numParedes=30;
  private int type;
  
  public Habitacion(PVector posicion){
    this.posicion=posicion;
    this.type=int(random(5));
    paredes=new Pared[numParedes];
    
    for(int i=0; i<numParedes; i++){
      boolean overlapping;
      Pared nuevaPared;
      
      do{
        overlapping=false;
        PVector pos=new PVector(random(60,550), random(80, 430));
        float ancho= random(100, 90);
        float alto = random(100, 90);
        boolean horizontal=random(1)>0.5;
        
      }while();
    }
  }
  
  public void dibujar(){
    fill(#F5ADAD);
    rect(posicion.x, posicion.y, 508, 450 );
  }
  
}
