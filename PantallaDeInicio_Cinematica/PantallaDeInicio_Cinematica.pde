import gifAnimation.Gif;
import processing.sound.*;

PImage imagen2;
PFont miFuente;
Gif gifImagen1;
SoundFile musicaCarga; 
SoundFile musicaCinematica; 

enum Estado {
  MOSTRANDO_IMAGEN1,
  MOSTRANDO_MENSAJE1,
  MOSTRANDO_IMAGEN2,
  MOSTRANDO_MENSAJE2,
  JUEGO,
  CINEMATICA
}

Estado estadoActual = Estado.MOSTRANDO_IMAGEN1;

PImage[] imagenes = new PImage[3];
String[] textos = {
  "Este es el momento, es mi única oportunidad",
  "Si encuentro las suficientes pistas demostraré que mi padre está abusando de mi hermano",
  "Quizás así creerán que hizo lo mismo conmigo"
};

int estadoCinematica = 0;

void setup() {
  size(1000, 550);
  gifImagen1 = new Gif(this, "imagen1.gif");
  gifImagen1.loop(); 
  imagen2 = loadImage("imagen2.png");
  imagenes[0] = loadImage("imagen1.png");
  imagenes[1] = loadImage("imagen22.png");
  imagenes[2] = loadImage("imagen3.png");
  miFuente = createFont("MiFuente.ttf", 32);
  textFont(miFuente);
  
  
  musicaCarga = new SoundFile(this, "musica_carga.mp3");
  musicaCinematica = new SoundFile(this, "musica_cinematica.mp3");
  
  
  musicaCarga.loop();
}

void draw() {
  background(0);
  switch (estadoActual) {
    case MOSTRANDO_IMAGEN1:
      image(gifImagen1, 0, 0, width, height);
      break;
    case MOSTRANDO_MENSAJE1:
    case MOSTRANDO_MENSAJE2:
      mostrarMensaje("Presiona ENTER para continuar");
      break;
    case MOSTRANDO_IMAGEN2:
      image(imagen2, 0, 0, width, height);
      break;
    case JUEGO:
     
      break;
    case CINEMATICA:
      image(imagenes[estadoCinematica], 0, 0, width, height);
      mostrarTexto(textos[estadoCinematica]);
      break;
  }
}

void mostrarMensaje(String mensaje) {
  fill(255);
  textAlign(CENTER, CENTER);
  text(mensaje, width / 2, height / 2);
}

void mostrarTexto(String texto) {
  fill(255, 255, 255, 150); 
  rect(0, height - 100, width, 100);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(40);
  text(texto, width / 2, height - 50);
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
      // Parar la música de carga
      musicaCarga.stop();
      // Iniciar música de cinemática en bucle
      musicaCinematica.loop();
      estadoActual = Estado.CINEMATICA;
    } else if (estadoActual == Estado.CINEMATICA) {
      estadoCinematica = (estadoCinematica + 1) % imagenes.length;
      if (estadoCinematica == 0) {
        estadoActual = Estado.JUEGO; 
        
        musicaCinematica.stop();
      }
    }
  }
}
