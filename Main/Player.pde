class Player extends GameEntity {
  Game game;
  int speed;
  PImage upImg, downImg, leftImg, rightImg, currentImg;
  int pistasRecolectadas;
  //Constructor de la clase Player 
  //@param parent La instancia de PApplet principal

  Player(PApplet parent) {
    super(parent, 50, 50);
    speed = 2;
    upImg = parent.loadImage("personaje_arriba.png");
    downImg = parent.loadImage("personaje_abajo.png");
    leftImg = parent.loadImage("personaje_izquierda.png");
    rightImg = parent.loadImage("personaje_derecha.png");
    currentImg = downImg;
    pistasRecolectadas = 0;
  }

  void setGame(Game game) {
    this.game = game;
  }

  @Override
  void display() {
    int offsetX = (parent.width - 500) / 2;
    int offsetY = (parent.height - 500) / 2;
    parent.image(currentImg, x + offsetX, y + offsetY, 45, 45);
    drawLightHalo(offsetX, offsetY);
  }

  @Override
  void update() {
    move();
    //Actualiza la posicion del jugador
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
        //Mueve al jugador según las teclas presionadas
      }
    }
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
        return true;
        //Verifica si el jugador colisiona con las paredes del laberinto 
        //@param newX Nueva posicion X propuesta
        //@param newY Nueva posicion Y propuesta
        //@return true si hay colision, false en caso contrario
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
 
  void drawLightHalo(int offsetX, int offsetY) {
    float lightX = x + 25 + offsetX;
    float lightY = y + 25 + offsetY;
    float haloSize = 150;
   
    parent.fill(255, 255, 224, 100);
    parent.noStroke();
    parent.ellipse(lightX, lightY, haloSize, haloSize);
  }
}
