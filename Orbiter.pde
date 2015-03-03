class Orbiter
{ 
  Vec2 center;
  Vec2 perimeter;
  
  color _color;
  
  
  Orbiter (Vec2 globalCenter)
  {
    center   = globalCenter;
    perimeter = new Vec2(0,0);
  }
  
  void orbit(float v, float a)
  {
    //_color = color(248, 255, 49, 10);
    stroke(_color);
    
    perimeter.y -= v;
    
    float s = sin(a);
    float c = cos(a);
    
    perimeter.x -= center.x;
    perimeter.y -= center.y;
    
    // rotate point
    float xnew = perimeter.x * c - perimeter.y * s;
    float ynew = perimeter.x * s + perimeter.y * c;
    
    // translate point back:
    perimeter.x = xnew + center.x;
    perimeter.y = ynew + center.y;
    
    line(center.x, center.y, perimeter.x, perimeter.y);
    
    perimeter.x = center.x;
    perimeter.y = center.y;
  }
} 
