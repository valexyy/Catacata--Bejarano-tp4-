import gifAnimation.Gif;

PImage imagen2;
PFont miFuente;
Gif gifImagen1;

enum Estado {
  MOSTRANDO_IMAGEN1,
  MOSTRANDO_MENSAJE1,
  MOSTRANDO_IMAGEN2,
  MOSTRANDO_MENSAJE2,
  JUEGO
}

Estado estadoActual = Estado.MOSTRANDO_IMAGEN1;

void setup() {
  size(1000, 550);
  gifImagen1 = new Gif(this, "imagen1.gif");
  gifImagen1.loop(); // Para que el GIF se reproduzca en bucle
  imagen2 = loadImage("imagen2.png");
  miFuente = createFont("MiFuente.ttf", 32);
  textFont(miFuente);
}

void draw() {
  background(0);
  switch (estadoActual) {
    case MOSTRANDO_IMAGEN1:
      image(gifImagen1, 0, 0, width, height);
      break;
    case MOSTRANDO_MENSAJE1:
    case MOSTRANDO_MENSAJE2:
      mostrarMensaje("Apretar ENTER para iniciar");
      break;
    case MOSTRANDO_IMAGEN2:
      image(imagen2, 0, 0, width, height);
      break;
    case JUEGO:
      // Aquí empieza tu juego
      break;
  }
}

void mostrarMensaje(String mensaje) {
  fill(255);
  textAlign(CENTER, CENTER);
  text(mensaje, width / 2, height / 2);
}

void keyPressed() {
  if (key == ENTER) {
    if (estadoActual == Estado.MOSTRANDO_IMAGEN1) {
      estadoActual = Estado.MOSTRANDO_MENSAJE1;
    } else if (estadoActual == Estado.MOSTRANDO_MENSAJE1) {
      estadoActual = Estado.MOSTRANDO_IMAGEN2;
    } else if (estadoActual == Estado.MOSTRANDO_IMAGEN2) {
      estadoActual = Estado.MOSTRANDO_MENSAJE2;
    } else if (estadoActual == Estado.MOSTRANDO_MENSAJE2) {
      estadoActual = Estado.JUEGO;
    }
  }
}
