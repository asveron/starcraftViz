import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioVisualizer audioVisualizer;
Minim minim;

float a = 0;

Orbiter orbiterSound;
Orbiter orbiterCircle;

Vec2 globalCenter;


CameraStars cameraStars;

void setup()
{
  size(3200, 600);

  minim = new Minim(this);
  audioVisualizer = new AudioVisualizer(minim, "wcs2014Final_G1.mp3");
  
  globalCenter = new Vec2(200,height/2);
  
  orbiterSound = new Orbiter(globalCenter);
  orbiterSound._color = color(248, 255, 49, 10);
  
  orbiterCircle = new Orbiter(globalCenter);
  orbiterCircle._color = color(0, 35, 255, 4);
  
  frameRate(60);
  background(0);
  
  cameraStars = new CameraStars(globalCenter);
}

void draw()
{
  float v = audioVisualizer.update();
  orbiterSound.orbit(50 + v, a * PI/180);
  orbiterCircle.orbit(100 , a * PI/180);
  
  a+=0.05;
  
  if (a > 360)
  {
    a = 0;
    orbiterSound.center.x+=300;
  }
  
  cameraStars.update();
}

void stop()
{
  
    minim.stop();
}

