private Habitacion habitacion;
private Pared[] paredes;
private Personaje personaje;
private JoyPad joyPad;
private Pista[] pistas;
private int pistasRecolectadas=0;

public void settings(){
   size(700, 600);//tamaño de la ventana
}
public void setup(){
  habitacion = new Habitacion(new PVector(100, 100));// creo el objeto habitacion
  personaje= new Personaje();
  personaje.setPosicion(new PVector(150,150));
  personaje.setVelocidad(new PVector(2,2));
  joyPad= new JoyPad();
  
  }
  

public void draw(){
  background(#FA9A9A);//fondo
  habitacion.dibujar();//dibujo la habitacion en la ventana
  
  for(Pared pared: paredes){
    if(pared!=null){
    pared.display();
    }
  } 
    personaje.display();
    
    for (Pista pista : pistas) {
    if (pista != null && !pista.isRecolectada()) {
      pista.display();
    }
  }
    
    if(joyPad.isUpPressed()){
   personaje.mover(0);
}

  if(joyPad.isRightPressed()){
  personaje.mover(1);
}

  if(joyPad.isDownPressed()){
  personaje.mover(2);
}

  if(joyPad.isLeftPressed()){
  personaje.mover(3);
  }
}


public void keyPressed(){
  if(key=='w'||keyCode==UP){
joyPad.setUpPressed(true);
}
 if(key=='s'||keyCode==DOWN){
joyPad.setDownPressed(true);
}
 if(key=='d'||keyCode==RIGHT){
joyPad.setRightPressed(true);
}
 if(key=='a'||keyCode==LEFT){
joyPad.setLeftPressed(true);
}
}

public void keyReleased() {
  if (key == 'w' || keyCode == UP) {
    joyPad.setUpPressed(false);
  }
  if (key == 's' || keyCode == DOWN) {
    joyPad.setDownPressed(false);
  }
  if (key == 'd' || keyCode == RIGHT) {
    joyPad.setRightPressed(false);
  }
  if (key == 'a' || keyCode == LEFT) {
    joyPad.setLeftPressed(false);
  }
}
