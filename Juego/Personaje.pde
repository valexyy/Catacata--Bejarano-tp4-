class Personaje{
  PImage spriteSheet;
  PImage [] sprites;
  int x, y, tamano;
  int direccion=0;
  
  public Personaje(int x, int y, int tamano, PImage[] sprites ){
     this.x = x;
     this.y = y;
     this.tamano = tamano;
     this.sprites = sprites;
  }
  
  public void dibujar(){
    image(sprites[direccion], x, y, 40, 40);
  }
  
  public void mover(int dx, int dy, Celda[][] grid){
    
    int nuevaX = x + dx * tamano;
    int nuevaY = y + dy * tamano;
    int i = (nuevaX - 90) / tamano;
    int j = (nuevaY - 50) / tamano;
    
    if (i >= 0 && i < grid.length && j >= 0 && j < grid[0].length) {
      Celda celda = grid[i][j];
      if (!colisiona(celda, dx, dy)) {
        x = nuevaX;
        y = nuevaY;
        direccion = obtenerDireccion(dx, dy);
      }
    }
  }
  
  boolean colisiona(Celda celda, int dx, int dy) {
    
    if (dy == -1 && celda.paredes[0]) return true;
    if (dy == 1 && celda.paredes[1]) return true; 
    if (dx == 1 && celda.paredes[2]) return true;
    if (dx == -1 && celda.paredes[3]) return true;
    return false;
  }

  int obtenerDireccion(int dx, int dy) {
    if (dy == -1) return 0;  // Arriba
    if (dy == 1) return 4;  // Abajo    
    if (dx == 1) return 2;  // Derecha
    if (dx == -1) return 6;  // Izquierda
    return direccion;
  }
  
}
