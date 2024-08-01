//Clase que maneja los efectos de sonido y musica del juego
class SoundManager {
  PApplet parent; 
  SoundFile musicaCarga; 
  SoundFile musicaCinematica; 
  SoundFile gameMusic; 
  SoundFile final1Music; 
  SoundFile final2Music; 
  SoundFile final3Music;
  SoundFile currentFinalMusic;
  //Constructor de SoundManager
  //@param parent La instancia de PApplet principal

  SoundManager(PApplet parent) {
    this.parent = parent;
    musicaCarga = new SoundFile(parent, "musica_carga.mp3"); 
    musicaCinematica = new SoundFile(parent, "musica_cinematica.mp3"); 
    gameMusic = new SoundFile(parent, "puzzle.wav"); 
    final1Music = new SoundFile(parent, "final1.wav");
    final2Music = new SoundFile(parent, "final2.wav"); 
    final3Music = new SoundFile(parent, "final3.wav");
  }

  void playMusicaCarga() {
    musicaCarga.loop();
    //Reproduce la musica de carga
  }

  void stopMusicaCarga() {
    musicaCarga.stop();
  }

  void playMusicaCinematica() {
    musicaCinematica.loop();
  }

  void stopMusicaCinematica() {
    musicaCinematica.stop();
  }

  void playGameMusic() {
    gameMusic.loop();
  }

  void stopGameMusic() {
    gameMusic.stop();
  }

  void playFinalMusic(Estado estado) {
    stopAllMusic();
    switch (estado) {
      case CINEMATICA:
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
    //Detiene toda la musica 
  }
}
