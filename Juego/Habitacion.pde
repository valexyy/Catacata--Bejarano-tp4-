class Habitacion{
  PVector posicion;
  int numParedes = 25;
  int type;
  
  public Habitacion(PVector posicion){
    this.posicion=posicion;
    this.type=int(random(5));
    paredes = new Pared[numParedes];
  
  for(int i=0; i<numParedes; i++){
    boolean overlapping;
    Pared nuevaPared;
    
    do{
      overlapping=false;
      PVector pos=new PVector(random(60, 550), random(80, 430));
      float ancho= random(100, 90);
      float alto=random(100, 90);
      boolean horizontal=random(1)>0.5;
      
      if(horizontal){
        nuevaPared= new Pared(pos, ancho, 20);
      }else{
        nuevaPared=new Pared(pos, 20, alto);
      }
      for(Pared pared: paredes){
        if(pared !=null && nuevaPared.seSuperpone(pared)){
          overlapping=true;
          break;
        }
      }
    }while(overlapping);
    paredes[i]=nuevaPared;

  }
  }
  
  public void dibujar(){
    fill(#FFD3D3); //cree un rectangulo para que se la pieza
    rect(60, 80 , 580, 450);
  }
  
  public void mostrarContadorPistas(){
  fill(0);
  textSize(27);
  text("Pistas recolectadas: " + pistasRecolectadas, 10, 20);
}
  
}
