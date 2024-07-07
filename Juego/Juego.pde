Habitacion habitacion;
Pared[] paredes;

public void setup(){
  size(700,600); //tamaño de la ventana
  habitacion= new Habitacion(new PVector(100, 100));
  //pared=new Pared(new PVector(180,170), 20, 90);
}

public void draw(){
  background(#E37C7C);
  habitacion.dibujar();
  for(Pared pared: paredes){
    if(pared!=null){
      pared.display();
    }
  }
}
