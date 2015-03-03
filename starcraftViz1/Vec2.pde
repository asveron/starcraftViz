class Vec2
{ 
  float x;
  float y;
  
  Vec2 (float x, float y)
  {
    this.x = x;
    this.y = y;
  }
} 

Vec2 minus(Vec2 v1, Vec2 v2)
{
  Vec2 result = new Vec2(0,0);
  
  result.x = v1.x - v2.x;
  result.y = v1.y - v2.y;
  
  return result;
}
