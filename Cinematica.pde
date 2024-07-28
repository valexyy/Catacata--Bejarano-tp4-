class Cinematica {
  PApplet parent;// Referencia al objeto PApplet principal
  PImage[] imagenes;
  String[] textos;
  int estadoCinematica;
 
  Cinematica(PApplet parent) {
    this.parent = parent;// Inicializa la referencia al objeto PApplet principal
    imagenes = new PImage[3];
    imagenes[0] = parent.loadImage("imagen1.png");
    imagenes[1] = parent.loadImage("imagen22.png");
    imagenes[2] = parent.loadImage("imagen3.png");
    
    // Inicializa el arreglo de textos con los diálogos de la cinemática
    textos = new String[]{
      "Este es el momento, es mi única oportunidad",
      "Si encuentro las suficientes pistas demostraré que mi padre está abusando de mi hermano",
      "Quizás así creerán que hizo lo mismo conmigo"
    };
    estadoCinematica = 0;
  }
 
  void display() {
    parent.background(0);
    parent.image(imagenes[estadoCinematica], 0, 0, parent.width, parent.height);
    mostrarTexto(textos[estadoCinematica]);
  }
 
  void mostrarTexto(String texto) {
    // Dibuja un rectángulo semitransparente en la parte inferior de la pantalla
    
    parent.fill(255, 255, 255, 150);
    parent.rect(0, parent.height - 100, parent.width, 100);
    parent.fill(0);
    parent.textAlign(PConstants.CENTER, PConstants.CENTER);
    parent.textSize(40);
    parent.text(texto, parent.width / 2, parent.height - 50);
  }
 
  void handleKeyPress() {
    // Avanza al siguiente estado de la cinemática al presionar la tecla Enter
    if (parent.key == PConstants.ENTER) {
      estadoCinematica++;
    }
  }
 
  boolean isFinished() {
    return estadoCinematica >= textos.length;
  }
}
