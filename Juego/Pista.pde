class Pista{
  private PVector posicion;
  private PImage imagen;
  private boolean recolectada;
  
  public Pista(PVector posicion, String imagePath){
    this.posicion=posicion;
    this.imagen=loadImage(imagePath);
    this.recolectada=false;
    
    pistas = new Pista[4];
for (int i = 0; i < pistas.length; i++) {
  PVector posicionAleatoria;
  boolean overlapping;
  
  do {
    overlapping = false;
    posicionAleatoria = generarPosicionAleatoria();
    
    // Verificar si se superpone con alguna pared
    for (Pared pared : paredes) {
      if (pared != null && pared.colisionaCon(posicionAleatoria, 50)) {
        overlapping = true;
        break;
      }
    }
    
    // Verificar si se superpone con alguna pista ya existente
    for (Pista pista : pistas) {
      if (pista != null && pista.getPosicion().dist(posicionAleatoria) < 50) {
        overlapping = true;
        break;
      }
    }
  } while (overlapping);
  
  pistas[i] = new Pista(posicionAleatoria, "pista" + (i + 1) + ".png");
}
    
  }
  
  public void display(){
    image(imagen, posicion.x, posicion.y, 50,50);
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
