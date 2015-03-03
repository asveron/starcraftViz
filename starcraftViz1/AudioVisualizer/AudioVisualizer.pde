class AudioVisualizer { 

  AudioPlayer song;
  FFT fft;
  float x;
  float y;
  float average;

  AudioVisualizer (Minim minim, String audioFile)
  {  
    average = 0;
    song = minim.loadFile(audioFile);
    song.play();
    fft = new FFT(song.bufferSize(), this.song.sampleRate());
  } 

  float update()
  { 
    fft.forward(song.left);

    for (int i = 0; i < fft.specSize (); i++)
    {
      average += fft.getBand(i);
    }
    average /= fft.specSize();
    average *= 100;

    return average;
  } 

  void stop()
  {
    song.close();
  }
} 

