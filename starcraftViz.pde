import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioVisualizer audioVisualizer;
Minim minim;

void setup()
{

  
  size(1000, 600, P3D);

  minim = new Minim(this);
  audioVisualizer = new AudioVisualizer(minim, "wcs2014Final_G1.mp3");
  
  println("test");
  frameRate(60);
}

void draw()
{
  audioVisualizer.update();
}

void stop()
{
  
    minim.stop();
}

