import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioVisualizer audioVisualizer;
Minim minim;

Orbiter orbiter;

void setup()
{
  size(1000, 600);

  minim = new Minim(this);
  audioVisualizer = new AudioVisualizer(minim, "wcs2014Final_G1.mp3");
  
  orbiter = new Orbiter(0,0);
  
  println("test");
  frameRate(60);
}

void draw()
{
  float v = audioVisualizer.update();
  orbiter.orbit(v);
}

void stop()
{
  
    minim.stop();
}

