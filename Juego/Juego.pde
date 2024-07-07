private Habitacion habitacion;
private Pared[] paredes;


public void setup(){
  size(700, 600);//tamaño de la ventana
  habitacion = new Habitacion(new PVector(100, 100));// creo el objeto habitacion
 
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
