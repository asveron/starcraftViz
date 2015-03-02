

class AudioVisualizer { 

  AudioPlayer song;
  FFT fft;
  float x;
  float y;
  float average;

  AudioVisualizer (Minim minim, String audioFile)
  {  
    this.average = 0;
    this.song = minim.loadFile(audioFile);
    this.song.play();
    this.fft = new FFT(song.bufferSize(), this.song.sampleRate());
  } 

  void update()
  { 
    this.fft.forward(song.left);

    for (int i = 0; i < this.fft.specSize (); i++)
    {
      // draw the line for frequency band i
      this.average += this.fft.getBand(i);
    }
    this.average /= this.fft.specSize();
    this.average *= 100;

    stroke(0, 0, 0, 10);

    line(this.x, height, this.x, height-this.average - this.y);
    this.average =0;
    this.x+=0.02;
  } 

  void stop()
  {
    song.close();
  }
} 

