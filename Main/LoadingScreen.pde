class LoadingScreen {
  PApplet parent;
  Gif gifImagen1; 
  PImage imagen2; 
  PFont miFuente;
  //Constructor de la clase LoadingScreen
  //Inicializa los recursos gráficos de la pantalla de carga
  //@param parent La instancia de PApplet principal
  LoadingScreen(PApplet parent) {
    this.parent = parent;
    gifImagen1 = new Gif(parent, "imagen1.gif");
    gifImagen1.loop();
    imagen2 = parent.loadImage("imagen2.png"); 
    miFuente = parent.createFont("MiFuente.ttf", 32);
  }
  
  void display(Estado estado) {
    parent.background(0);
    
    switch (estado) {
      case MOSTRANDO_IMAGEN1:
        parent.image(gifImagen1, 0, 0, parent.width, parent.height);
        break;
      case MOSTRANDO_MENSAJE1:
      case MOSTRANDO_MENSAJE2:
        mostrarMensaje("Presiona ENTER para continuar");
        break;
      case MOSTRANDO_IMAGEN2:
        parent.image(imagen2, 0, 0, parent.width, parent.height);
        break;
      case CINEMATICA:
        break;
      default:
        break;
        //Muestra la pantalla de carga según el estado actual del juego
        //@param estado El estado actual del juego
    }
  }

  void mostrarMensaje(String mensaje) {
    parent.fill(255); 
    parent.textFont(miFuente);
    parent.textAlign(PConstants.CENTER, PConstants.CENTER);
    parent.text(mensaje, parent.width / 2, parent.height / 2); 
    //Muestra  un mensaje en la pantalla de carga
    //@param mensaje El mensaje a mostrar
  }
}
