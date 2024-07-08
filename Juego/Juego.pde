Habitacion habitacion;
Personaje personaje;
Linterna linterna;
Laberinto laberinto;
Pista pistas;
PImage[] imagenesPistas;

void setup() {
  size(800, 800);
  imagenesPistas = new PImage[3];
  imagenesPistas[0] = loadImage("pista1.png");
  imagenesPistas[1] = loadImage("pista2.png");
  imagenesPistas[2] = loadImage("pista3.png");
  
  habitacion = new Habitacion(50, 50, 700, 700);
  laberinto = new Laberinto(90, 50, 600, 400, );
  personaje = new Personaje(75, 75, loadImage("personaje.png"));
  linterna = new Linterna(75, 75, 0);
}

void draw() {
  background(0);
  habitacion.dibujar();
  
  // Capa semitransparente negra
  fill(0, 200);
  rect(0, 0, width, height);
  
  // Dibujar linterna
  linterna.actualizar(personaje.x + personaje.sprite.width / 2, personaje.y + personaje.sprite.height / 2, personaje.direccion);
  linterna.dibujar();
  
  // Comprobar colisiones con pistas
  habitacion.laberinto.comprobarPistas(personaje);
  
  // Personaje
  personaje.dibujar();
  
  // Mostrar cantidad de pistas recogidas
  fill(255);
  textSize(20);
  text("Pistas recogidas: " + personaje.pistasRecogidas, 10, height - 20);
}

void keyPressed() {
  if (key == 'w') personaje.mover(0, -5);
  if (key == 's') personaje.mover(0, 5);
  if (key == 'a') personaje.mover(-5, 0);
  if (key == 'd') personaje.mover(5, 0);
  if (key == 'r' && personaje.pistasRecogidas >= 4) {
    habitacion = new Habitacion(50, 50, 700, 700);
    personaje.pistasRecogidas = 0; // Resetear contador de pistas
  }
}
