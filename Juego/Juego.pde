Habitacion habitacion;
Personaje personaje;
Linterna linterna;
PImage[] imagenesPistas;

void setup() {
  size(800, 600);
  imagenesPistas = new PImage[3];
  imagenesPistas[0] = loadImage("pista1.png");
  imagenesPistas[1] = loadImage("pista2.png");
  imagenesPistas[2] = loadImage("pista3.png");
  
  habitacion = new Habitacion(50, 50, 700, 500, imagenesPistas);
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
  
  // Personaje
  personaje.dibujar();
}

void keyPressed() {
  if (key == 'w') personaje.mover(0, -5);
  if (key == 's') personaje.mover(0, 5);
  if (key == 'a') personaje.mover(-5, 0);
  if (key == 'd') personaje.mover(5, 0);
}
