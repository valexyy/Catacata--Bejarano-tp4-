class Pista {
  PVector pos;
  PImage imagen;
  boolean recolectada;

  Pista(PVector pos, String imagePath) {
    this.pos = pos;
    this.imagen = loadImage(imagePath);
  }

  void display() {
    image(imagen, pos.x, pos.y, 50, 50);
  }
  
  public PVector getPosicion(){
    return this.pos;
  }
  
  public boolean isRecolectada(){
    return this.recolectada;
  }
  
  public void recolectar(){
    this.recolectada=true;
  }
  
  public PVector generarPosicionAleatoria(){
  
  float x = random(habitacion.ancho, habitacion.ancho + 500 - 40); // Ajusta el tamaño de la habitación y de las pistas
  float y = random(habitacion.alto, habitacion.alto + 400 - 40);
  return new PVector(x, y);  
}


  
}
