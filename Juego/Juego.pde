private Habitacion habitacion;
private Pared[] paredes;
private Personaje personaje;
private JoyPad joyPad;

public void setup(){
  size(700, 600);//tamaño de la ventana
  habitacion = new Habitacion(new PVector(100, 100));// creo el objeto habitacion
  personaje= new Personaje();
  personaje.setPosicion(new PVector(50,100));
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
    personaje.display();
    
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
}

public void keyReleased(){
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
