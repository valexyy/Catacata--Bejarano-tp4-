Habitacion habitacion;
Personaje personaje;
Pista[] pistas;

void setup() {
  size(800, 600);
  habitacion = new Habitacion(width, height);
  personaje = new Personaje(width / 2, height / 2);
  pistas= new Pista[4];
}

void draw() {
  background(50); // Fondo oscuro para resaltar la linterna
  habitacion.display();
  personaje.mover();
  personaje.verificarColision(habitacion.laberinto);
  personaje.verificarRecoleccion();
  personaje.display();
}
