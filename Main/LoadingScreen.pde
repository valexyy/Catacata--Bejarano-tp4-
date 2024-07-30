class LoadingScreen {
  PApplet parent; // Referencia al objeto PApplet principal
  Gif gifImagen1; 
  PImage imagen2; 
  PFont miFuente; // Fuente personalizada para mostrar mensajes
  
  LoadingScreen(PApplet parent) {
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal
    gifImagen1 = new Gif(parent, "imagen1.gif"); // Carga y configura el GIF
    gifImagen1.loop(); // Inicia el bucle del GIF
    imagen2 = parent.loadImage("imagen2.png"); 
    miFuente = parent.createFont("MiFuente.ttf", 32); // Crea la fuente personalizada
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
      // No se necesita mostrar nada específico para la cinemática en la pantalla de carga
      break;
    default:
      // Manejar otros estados si es necesario
      break;
  }
}


  void mostrarMensaje(String mensaje) {
    parent.fill(255); 
    parent.textFont(miFuente); // Establece la fuente personalizada
    parent.textAlign(PConstants.CENTER, PConstants.CENTER); // Alinea el texto al centro
    parent.text(mensaje, parent.width / 2, parent.height / 2); 
  }
}
