Habitacion habitacion;
Laberinto laberinto;
PImage[] sprite= new PImage[8];
Personaje personaje;

void setup() {
  size(800, 500);  // Tamaño de la ventana
  habitacion = new Habitacion(90, 50, 600, 400);
  laberinto = new Laberinto(90, 50, 600, 400, color(123, 26, 94, 180));
  personaje= new Personaje(90, 50, 40, sprite);
  personaje.spriteSheet = loadImage("personaje.png");
  for (int i = 0; i < 8; i++) {
    personaje.sprites[i] = personaje.spriteSheet.get(0, i * (personaje.spriteSheet.height / 8), personaje.spriteSheet.width, personaje.spriteSheet.height / 8);
  }
  //personaje = new Personaje(90, 50, 40, personaje.sprites);
  
}

void draw() {
  background(0);   // Fondo negro
  habitacion.dibujar();
  laberinto.dibujar();
  personaje.dibujar();
}

void keyPressed() {
  if (key == 'r') {
    laberinto.generarNuevoLaberinto();
    personaje.dibujar();
  }
  
   if (keyCode == UP) {
    personaje.mover(0, -1, laberinto.grid);
  } else if (keyCode == DOWN) {
    personaje.mover(0, 1, laberinto.grid);
  } else if (keyCode == LEFT) {
    personaje.mover(-1, 0, laberinto.grid);
  } else if (keyCode == RIGHT) {
    personaje.mover(1, 0, laberinto.grid);
  }
  
}
