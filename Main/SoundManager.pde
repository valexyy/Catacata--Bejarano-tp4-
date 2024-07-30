class SoundManager {
  PApplet parent; 
  SoundFile musicaCarga; 
  SoundFile musicaCinematica; 
  SoundFile gameMusic; 
  SoundFile final1Music; 
  SoundFile final2Music; 
  SoundFile final3Music;
  SoundFile currentFinalMusic;

  SoundManager(PApplet parent) {
    this.parent = parent; // Inicializa la referencia al objeto PApplet principal
    musicaCarga = new SoundFile(parent, "musica_carga.mp3"); 
    musicaCinematica = new SoundFile(parent, "musica_cinematica.mp3"); 
    gameMusic = new SoundFile(parent, "puzzle.wav"); 
    final1Music = new SoundFile(parent, "final1.wav");
    final2Music = new SoundFile(parent, "final2.wav"); 
    final3Music = new SoundFile(parent, "final3.wav");
  }

  void playMusicaCarga() {
    musicaCarga.loop(); // Reproduce en bucle la música de carga
  }

  void stopMusicaCarga() {
    musicaCarga.stop(); // Detiene la música de carga
  }

  void playMusicaCinematica() {
    musicaCinematica.loop(); // Reproduce en bucle la música de la cinemática
  }

  void stopMusicaCinematica() {
    musicaCinematica.stop(); // Detiene la música de la cinemática
  }

  void playGameMusic() {
    gameMusic.loop(); // Reproduce en bucle la música del juego
  }

  void stopGameMusic() {
    gameMusic.stop(); // Detiene la música del juego
  }

void playFinalMusic(Estado estado) {
  stopAllMusic(); // Detiene todas las músicas
  switch (estado) {
    case CINEMATICA:
      // No reproducir música para la cinemática
      currentFinalMusic = null;
      break;
    case FINAL1:
      currentFinalMusic = final1Music;
      break;
    case FINAL2:
      currentFinalMusic = final2Music;
      break;
    case FINAL3:
      currentFinalMusic = final3Music;
      break;
    default:
      // Manejar otros estados si es necesario
      currentFinalMusic = null;
      break;
  }

  if (currentFinalMusic != null) {
    currentFinalMusic.loop();
  }
}

  void stopAllMusic() {
    musicaCarga.stop(); 
    musicaCinematica.stop(); 
    gameMusic.stop();
    final1Music.stop(); 
    final2Music.stop(); 
    final3Music.stop(); 
  }

 }
