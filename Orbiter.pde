class Orbiter
{ 
  Vec2 center;
  Vec2 perimeter;  
  Vec2 distance;
  
  Orbiter (float x, float y)
  {
    center   = new Vec2(width/2,height/2);
    perimeter = new Vec2(width/2,height/2 - 10);
  }
  
  void orbit(float v)
  {

    float s = sin( 1 * PI/180);
    float c = cos( 1 * PI/180);
    
    perimeter.x -= center.x;
    perimeter.y -= center.y;
    
    distance = minus(center, perimeter);
    //distance.y += 100;
    
    // rotate point
    float xnew = perimeter.x * c - perimeter.y * s;
    float ynew = perimeter.x * s + perimeter.y * c;
    
    // translate point back:
    perimeter.x = xnew + center.x;
    perimeter.y = ynew + center.y;
    
    line(center.x, center.y, perimeter.x, perimeter.y);
  }
} 
