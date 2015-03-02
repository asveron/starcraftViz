

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

    stroke(0, 0, 0, 10);

    //line(x, height, x, height - average - y);
    this.average = 0;
    //this.x += 0.02;
    
    return average;
  } 

  void stop()
  {
    song.close();
  }
} 

