Habitacion habitacion;

public void setup(){
  size(700,600); //tamaño de la ventana
  habitacion= new Habitacion(new PVector(100, 70));
}

public void draw(){
  background(#E37C7C);
  habitacion.dibujar();
}
