Habitacion habitacion;
Laberinto laberinto;
Personaje personaje;

void setup() {
  size(800, 500);  // Tamaño de la ventana
  habitacion = new Habitacion(90, 50, 600, 400);
  laberinto = new Laberinto(90, 50, 600, 400, color(123, 26, 94, 180));
}

void draw() {
  background(0);   // Fondo negro
  habitacion.dibujar();
  laberinto.dibujar();
}

void keyPressed() {
  if (key == 'r') {
    laberinto.generarNuevoLaberinto();
  }
}
