import processing.sound.*;

int estado = 0; // 0: Juego, 1: Final 1, 2: Final 2, 3: Final 3
PImage upImg, downImg, leftImg, rightImg;
PImage currentImg;
PImage[] pistasImg = new PImage[6];
int characterX = 50;
int characterY = 50;
int characterSpeed = 2;
int cellSize = 50;
int currentMaze = 0;
ArrayList<PVector> pistas = new ArrayList<PVector>();

int pistasRecolectadas = 0; // Contador de pistas recolectadas en total

int[][] maze1 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 0, 0, 0, 1, 0, 0, 0, 0, 1},
  {1, 0, 1, 0, 1, 0, 1, 1, 0, 1},
  {1, 0, 1, 0, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 1, 1, 1, 0, 1, 0, 1},
  {1, 0, 0, 0, 0, 1, 0, 1, 0, 1},
  {1, 0, 1, 1, 0, 1, 0, 1, 0, 1},
  {1, 0, 0, 1, 0, 1, 0, 0, 0, 1},
  {1, 1, 0, 1, 0, 0, 0, 1, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

int[][] maze2 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 0, 1, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 1, 0, 1},
  {1, 1, 1, 1, 1, 0, 0, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 1, 0, 1, 0, 1, 0, 1},
  {1, 0, 1, 0, 0, 1, 0, 0, 0, 1},
  {1, 0, 0, 0, 1, 1, 1, 1, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

int[][] maze = maze1;

// Variables de sonido
SoundFile gameMusic;
SoundFile final1Music;
SoundFile final2Music;
SoundFile final3Music;

void setup() {
  size(1000, 550);
  upImg = loadImage("personaje_arriba.png");
  downImg = loadImage("personaje_abajo.png");
  leftImg = loadImage("personaje_izquierda.png");
  rightImg = loadImage("personaje_derecha.png");
  for (int i = 0; i < 6; i++) {
    pistasImg[i] = loadImage("pista" + (i + 1) + ".png");
  }
  currentImg = downImg; // Imagen inicial mirando hacia abajo

  initializePistas();
 
  // Cargar música
  gameMusic = new SoundFile(this, "puzzle.wav");
  final1Music = new SoundFile(this, "final1.wav");
  final2Music = new SoundFile(this, "final2.wav");
  final3Music = new SoundFile(this, "final3.wav");
 
  // Iniciar música del juego
  gameMusic.loop();
}

void draw() {
  if (estado == 0) {
    drawGame();
  } else if (estado == 1) {
    image(loadImage("final1.png"), 0, 0, width, height);
    if (!final1Music.isPlaying()) {
      stopAllMusic();
      final1Music.loop();
    }
  } else if (estado == 2) {
    image(loadImage("final2.png"), 0, 0, width, height);
    if (!final2Music.isPlaying()) {
      stopAllMusic();
      final2Music.loop();
    }
  } else if (estado == 3) {
    image(loadImage("final3.png"), 0, 0, width, height);
    if (!final3Music.isPlaying()) {
      stopAllMusic();
      final3Music.loop();
    }
  }
}

void stopAllMusic() {
  gameMusic.stop();
  final1Music.stop();
  final2Music.stop();
  final3Music.stop();
}

void drawGame() {
  background(255);

  // Dibujar el laberinto
  for (int row = 0; row < maze.length; row++) {
    for (int col = 0; col < maze[row].length; col++) {
      if (maze[row][col] == 1) {
        fill(140, 157, 173); // Celeste medio oscuro
      } else {
        fill(96, 59, 42); // Marrón medio roble
      }
      rect(col * cellSize, row * cellSize, cellSize, cellSize);
    }
  }

  // Aplicar un tono azul oscuro a toda la pantalla
  fill(0, 0, 128, 127); // Azul oscuro semi-transparente
  rect(0, 0, width, height);

  // Dibujar el halo de luz frente al personaje
  drawLightHalo();

  // Dibujar el personaje
  image(currentImg, characterX, characterY, cellSize, cellSize);

  // Dibujar las pistas
  for (int i = 0; i < pistas.size(); i++) {
    PVector pista = pistas.get(i);
    image(pistasImg[i], pista.x, pista.y, cellSize / 2, cellSize / 2);
  }

  moveCharacter();
  checkPistasCollection();
  checkMazeCompletion();
}

void drawLightHalo() {
  float lightX = characterX + cellSize / 2;
  float lightY = characterY + cellSize / 2;
  float haloSize = 150; // Tamaño del halo de luz

  fill(255, 255, 224, 100); // Amarillo claro semi-transparente
  noStroke();
  ellipse(lightX, lightY, haloSize, haloSize);
}

void moveCharacter() {
  int newX = characterX;
  int newY = characterY;

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      currentImg = upImg;
      newY -= characterSpeed;
    } else if (key == 's' || key == 'S') {
      currentImg = downImg;
      newY += characterSpeed;
    } else if (key == 'a' || key == 'A') {
      currentImg = leftImg;
      newX -= characterSpeed;
    } else if (key == 'd' || key == 'D') {
      currentImg = rightImg;
      newX += characterSpeed;
    }

    // Verificar colisión con los muros
    if (!isColliding(newX, newY)) {
      characterX = newX;
      characterY = newY;
    }
  }
}

boolean isColliding(int x, int y) {
  int col = x / cellSize;
  int row = y / cellSize;

  // Asegurar que las coordenadas estén dentro de los límites del laberinto
  if (col < 0 || col >= maze[0].length || row < 0 || row >= maze.length) {
    return true;
  }

  // Verificar cada esquina del personaje
  boolean topLeft = maze[row][col] == 1;
  boolean topRight = maze[row][(x + cellSize - 1) / cellSize] == 1;
  boolean bottomLeft = maze[(y + cellSize - 1) / cellSize][col] == 1;
  boolean bottomRight = maze[(y + cellSize - 1) / cellSize][(x + cellSize - 1) / cellSize] == 1;

  return topLeft || topRight || bottomLeft || bottomRight;
}

void checkPistasCollection() {
  for (int i = pistas.size() - 1; i >= 0; i--) {
    PVector pista = pistas.get(i);
    if (dist(characterX + cellSize / 2, characterY + cellSize / 2, pista.x + cellSize / 4, pista.y + cellSize / 4) < cellSize / 2) {
      pistas.remove(i);
      pistasRecolectadas++; // Incrementar el contador de pistas recolectadas
    }
  }
}

void checkMazeCompletion() {
  // Verificar si el personaje llegó a la esquina inferior derecha del laberinto
  if (characterX / cellSize == maze[0].length - 2 && characterY / cellSize == maze.length - 2) {
    // Mover al siguiente laberinto
    if (currentMaze == 0) {
      maze = maze2;
      characterX = 50; // Posición inicial para el segundo laberinto
      characterY = 50;
      currentMaze = 1;
      pistas.clear();
      initializePistas();
    } else {
      // Determinar el estado según la cantidad de pistas recolectadas en total
      if (pistasRecolectadas >= 6) {
        estado = 3; // Final 3
      } else if (pistasRecolectadas >= 4) {
        estado = 2; // Final 2
      } else if (pistasRecolectadas >= 2) {
        estado = 1; // Final 1
      } else {
        estado = 0; // Debería seguir en el juego si no se cumple ninguna condición de final
      }
    }
  }
}

void initializePistas() {
  pistas.clear();

  ArrayList<PVector> validPositions = new ArrayList<PVector>();

  for (int row = 0; row < maze.length; row++) {
    for (int col = 0; col < maze[row].length; col++) {
      if (maze[row][col] == 0) {
        validPositions.add(new PVector(col * cellSize, row * cellSize));
      }
    }
  }

  int numPistas = 3; // Número de pistas por laberinto
  for (int i = 0; i < numPistas; i++) {
    if (validPositions.size() > 0) {
      int index = int(random(validPositions.size()));
      pistas.add(validPositions.remove(index));
    }
  }
}
