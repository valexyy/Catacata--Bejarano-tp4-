PImage[] imagenes = new PImage[3];
PFont miFuente;
String[] textos = {
  "Este es el momento, es mi unica oportunidad",
  "Si encuentro las suficientes pistas demostrare que mi padre esta abusando de mi hermano",
  "Quizas asi creeran que hizo lo mismo conmigo"
};

int estadoActual = 0;

void setup() {
  size(1000, 550);
  imagenes[0] = loadImage("imagen1.png");
  imagenes[1] = loadImage("imagen2.png");
  imagenes[2] = loadImage("imagen3.png");
  miFuente = createFont("MiFuente.ttf", 32);
  textFont(miFuente);
}

void draw() {
  background(0);
  image(imagenes[estadoActual], 0, 0, width, height);
  mostrarTexto(textos[estadoActual]);
}

void mostrarTexto(String texto) {
  fill(255, 255, 255, 150); // Fondo semitransparente para el texto
  rect(0, height - 100, width, 100);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(40);
  text(texto, width / 2, height - 50);
}

void keyPressed() {
  if (key == ENTER) {
    estadoActual = (estadoActual + 1) % imagenes.length;
  }
}
