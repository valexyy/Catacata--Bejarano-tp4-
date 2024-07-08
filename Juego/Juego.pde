Habitacion habitacion;
Laberinto laberinto;
PImage[][] sprite = new PImage[4][4];
Personaje personaje;

void setup() {
  size(800, 500);  // Tamaño de la ventana
  personaje = new Personaje(90, 50, 40, 40, sprite);
  personaje.spriteSheet = loadImage("personaje.png");
  int spriteCols = 4;  // número de columnas de sprites
  int spriteRows = 4;  // número de filas de sprites
  int spriteWidth = personaje.spriteSheet.width / spriteCols;
  int spriteHeight = personaje.spriteSheet.height / spriteRows;
  
   println("Sprite Sheet Dimensions: " + 2560 + "x" + 1440);
  println("Sprite Dimensions: " + 2560 + "x" + 1440);

  if (40 % spriteCols == 0 && 40 % spriteRows == 0) {
    println("The sprite sheet can be divided into 4x4 sprites.");
  } else {
    println("The sprite sheet cannot be evenly divided into 4x4 sprites.");
  }
  
  for (int i = 0; i < spriteRows; i++) {
    for (int j = 0; j < spriteCols; j++) {
      personaje.sprites[i][j] = personaje.spriteSheet.get(j * spriteWidth, i * spriteHeight, spriteWidth, spriteHeight);
    }
  }
  habitacion = new Habitacion(90, 50, 600, 400);
  laberinto = new Laberinto(90, 50, 600, 400, color(123, 26, 94, 180));
}

void draw() {
  background(0);   // Fondo negro
  habitacion.dibujar();
  laberinto.dibujar();
  personaje.dibujar();
}

void keyPressed() {
  int dx = 0;
  int dy = 0;

  if (keyCode == UP) dy = -1;
  if (keyCode == DOWN) dy = 1;
  if (keyCode == LEFT) dx = -1;
  if (keyCode == RIGHT) dx = 1;

  if (dx != 0 || dy != 0) {
    personaje.mover(dx, dy, laberinto.grid);
  }

  if (key == 'r') {
    laberinto.generarNuevoLaberinto();
  }
}
