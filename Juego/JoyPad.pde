class JoyPad{
  private boolean upPressed;
 private boolean downPressed;
 private boolean rightPressed;
 private boolean leftPressed;


public boolean isUpPressed(){
return this.upPressed;
}
public void setUpPressed(boolean upPressed){
this.upPressed=upPressed;
}

public boolean isDownPressed(){
return this.downPressed;
}
public void setDownPressed(boolean downPressed){
this.downPressed=downPressed;
}


public boolean isRightPressed(){
return this.rightPressed;
}
public void setRightPressed(boolean rightPressed){
this.rightPressed=rightPressed;
}

public boolean isLeftPressed(){
return this.leftPressed;
}
public void setLeftPressed(boolean leftPressed){
this.leftPressed=leftPressed;
}



public PVector generarPosicionAleatoria(){
  
  float x = random(habitacion.posicion.x, habitacion.posicion.x + 500 - 40); // Ajusta el tamaño de la habitación y de las pistas
  float y = random(habitacion.posicion.y, habitacion.posicion.y + 400 - 40);
  return new PVector(x, y);  
}
}
