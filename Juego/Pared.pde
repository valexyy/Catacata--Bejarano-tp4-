class Pared {
  private PVector posicion;
   float w, h;


  public Pared(PVector posicion, float w, float h) {
    this.posicion = posicion;
    this.w = w;
    this.h = h;
  }

  void display() {
    rect(posicion.x, posicion.y, w, h);
  }
}
