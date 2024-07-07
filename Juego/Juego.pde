private Habitacion habitacion;
private Pared[] paredes;
private JoyPad joyPad;

public void setup(){
  size(700, 600);//tamaño de la ventana
  habitacion = new Habitacion(new PVector(100, 100));// creo el objeto habitacion
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
}

public void keyReleased(){
  if(key=='w'||keyCode==UP){
joyPad.setUpPressed(false);
}
 if(key=='s'||keyCode==DOWN){
joyPad.setDownPressed(false);
}
 if(key=='d'||keyCode==RIGHT){
joyPad.setRightPressed(false);
}
 if(key=='a'||keyCode==LEFT){
joyPad.setLeftPressed(false);
}
}
