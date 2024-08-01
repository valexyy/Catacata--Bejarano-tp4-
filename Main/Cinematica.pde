class Cinematica {
  PApplet parent;
  PImage[] imagenes;
  String[] textos;
  int estadoCinematica;
  //Constructor de la clase Cinematica
  //Inicializa las imagenes y textos de la cinematica
  //@param parent La instancia de PApplet principal
 
  Cinematica(PApplet parent) {
    this.parent = parent;
    imagenes = new PImage[3];
    imagenes[0] = parent.loadImage("imagen1.png");
    imagenes[1] = parent.loadImage("imagen22.png");
    imagenes[2] = parent.loadImage("imagen3.png");
    
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
    //Muestra la cinematica en pantalla
  }
 
  void mostrarTexto(String texto) {
    parent.fill(255, 255, 255, 150);
    parent.rect(0, parent.height - 100, parent.width, 100);
    parent.fill(0);
    parent.textAlign(PConstants.CENTER, PConstants.CENTER);
    parent.textSize(40);
    parent.text(texto, parent.width / 2, parent.height - 50);
    //Muestra el texto de la cinematica en pantalla
    //@param texto El texto a mostrar
  }
 
  void handleKeyPress() {
    if (parent.key == PConstants.ENTER) {
      estadoCinematica++;
      //Maneja las pulsaciones de teclas durante la cinematica
    }
  }
 
  void reset() {
    estadoCinematica = 0;
    //Reinicia la cinematica a su estado inicial
  }

  boolean isFinished() {
    return estadoCinematica >= textos.length;
    //Verifica si la cinematica ha terminado
    //@return true si la cinematica ha terminado, false en caso contrario
  }
}
