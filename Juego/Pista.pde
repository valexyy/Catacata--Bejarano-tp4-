class Pista{
  private PVector posicion;
  private PImage oso, foto, diario;
  private boolean recolectada;
  
  public Pista(PVector posicion){
    this.posicion=posicion;
    oso=loadImage("oso.png");
    diario=loadImage("diario.png");
    foto=loadImage("foto.png");
    this.recolectada=false;
  }
  
  public void display(){
    image(oso, posicion.x, posicion.y, 20,20);
    image(diario, posicion.x, posicion.y, 20,20);
    image(foto, posicion.x, posicion.y, 50,50);
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
