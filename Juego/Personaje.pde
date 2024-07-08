class Personaje {
  float x, y;
  float velocidad = 2;
  PImage sprite;
  Linterna linterna;
  Pista[] pistas;

  Personaje(float x, float y) {
    this.x = x;
    this.y = y;
    sprite = loadImage("personaje.png");
    linterna = new Linterna();
  }

  void mover() {
    if (keyPressed) {
      if (key == 'w') y -= velocidad;
      if (key == 's') y += velocidad;
      if (key == 'a') x -= velocidad;
      if (key == 'd') x += velocidad;
      // Agrega las direcciones diagonales si es necesario
    }
  }

  void display() {
    image(sprite, x, y);
    linterna.display(x, y);
  }

  void verificarColision(Laberinto laberinto) {
    for (Pared pared : laberinto.paredes) {
      if (x + sprite.width > pared.posicion.x && x < pared.posicion.x + pared.w &&
          y + sprite.height > pared.posicion.y && y < pared.posicion.y + pared.h) {
        // Revertir el movimiento si colisiona
        if (key == 'w') y += velocidad;
        if (key == 's') y -= velocidad;
        if (key == 'a') x += velocidad;
        if (key == 'd') x -= velocidad;
      }
    }
  }

  public void verificarRecoleccion(){
  PVector posicionPersonaje= personaje.getPosicion();
  
  for(Pista pista: pistas){
    if(pista != null && !pista.isRecolectada() && pista.getPosicion().dist(posicionPersonaje)<50){
      pista.recolectar();
      pistasRecolectadas++;
    }
  }
 }
 
 PVector getPosicion(){
   return new PVector(x, y);
 } 
}
