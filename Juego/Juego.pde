Habitacion habitacion;
Personaje personaje;
Pared[] pared;
Pista[] pistas;

void setup() {
  size(800, 600);
  habitacion = new Habitacion(width, height);
  personaje = new Personaje(width / 2, height / 2);
}

void draw() {
  background(50); // Fondo oscuro para resaltar la linterna
  habitacion.display();
  personaje.mover();
  personaje.verificarColision(habitacion.laberinto);
  personaje.recolectarPistas(habitacion.pistas);
  personaje.display();
}
