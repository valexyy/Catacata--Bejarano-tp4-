class Player {
  PApplet parent;// Referencia al objeto PApplet principal
  Game game;
  
  int x, y;
  int speed;
  PImage upImg, downImg, leftImg, rightImg, currentImg;
  int pistasRecolectadas;
 
  Player(PApplet parent) {
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal  
    x = 50; //Posicion inicial en X
    y = 50; // Posicion inicial en Y 
    speed = 2;
    upImg = parent.loadImage("personaje_arriba.png");
    downImg = parent.loadImage("personaje_abajo.png");
    leftImg = parent.loadImage("personaje_izquierda.png");
    rightImg = parent.loadImage("personaje_derecha.png");
    currentImg = downImg;
    pistasRecolectadas = 0;
  }
  
  void setGame (Game game) {
    this.game = game;
    
  }
  void display() {
    int offsetX = (parent.width - 500) / 2;
    int offsetY = (parent.height - 500) / 2;
    parent.image(currentImg, x + offsetX, y + offsetY, 50, 50);
    drawLightHalo(offsetX, offsetY);
  }
 
  void move() {
    int newX = x;
    int newY = y;
    if (parent.keyPressed) {
      if (parent.key == 'w') {
        newY -= speed;
        currentImg = upImg;
      } else if (parent.key == 's') {
        newY += speed;
        currentImg = downImg;
      } else if (parent.key == 'a') {
        newX -= speed;
        currentImg = leftImg;
      } else if (parent.key == 'd') {
        newX += speed;
        currentImg = rightImg;
      }
     
      if (!isColliding(newX, newY)) {
        x = newX;
        y = newY;
      }
    }
  }
 
  void handleKeyPress() {
    // Este método ya no es necesario ya que el movimiento se maneja en el método move()
  }
 
  boolean isColliding(int newX, int newY) {
    int cellSize = 50;
    int steps = speed;
    for (int i = 1; i <= steps; i++){
     int checkX = x + (newX - x) * i / steps;
     int checkY = y + (newY - y) * i/ steps;
     int col = checkX / cellSize;
     int row = checkY /cellSize;
     int[][] maze = game.maze.maze;
     
     if (col < 0 || col >= maze[0].length || row < 0 || row >= maze.length) {
      return true; // Retorna true si el jugador está fuera del laberinto
    }
   
    boolean topLeft = maze[row][col] == 1;
    boolean topRight = maze[row][(newX + cellSize - 1) / cellSize] == 1;
    boolean bottomLeft = maze[(newY + cellSize - 1) / cellSize][col] == 1;
    boolean bottomRight = maze[(newY + cellSize - 1) / cellSize][(newX + cellSize - 1) / cellSize] == 1;
   
    if (topLeft || topRight || bottomLeft || bottomRight) {
      return true; 
    }
   }
    
    return false;
  }
 
  void drawLightHalo(int offsetX, int offsetY) { //Dibuja el halo de luz 
    float lightX = x + 25 + offsetX;
    float lightY = y + 25 + offsetY;
    float haloSize = 150;
   
    parent.fill(255, 255, 224, 100);
    parent.noStroke();
    parent.ellipse(lightX, lightY, haloSize, haloSize);
  }
}
