class Linterna {
  void display(float x, float y) {
    noStroke();
    fill(255, 255, 100, 50); // Color amarillo con transparencia
    ellipse(x + 20, y + 20, 100, 100); // Ajusta el tamaño y posición de la luz según sea necesario
  }
}
