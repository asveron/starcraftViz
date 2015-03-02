import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

class AudioVisualizer { 

  Minim minim;
  AudioPlayer song;
  FFT fft;
  float x;
  float y;
  float average;
  String audioFile;

  AudioVisualizer (String audioFile2)
  {  
    
  println("test");
    this.audioFile = audioFile2;
    this.average = 0;
    this.minim = new Minim(this);
    this.song = minim.loadFile(audioFile, 512);
    this.song.play();
    this.fft = new FFT(song.bufferSize(), this.song.sampleRate());
    
    
  println("test");
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
    minim.stop();
  }
} 

