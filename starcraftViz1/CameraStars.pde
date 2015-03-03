class CameraStars
{ 
  float time;
  Vec2 centralPoint;
  
  int starIndex;
  String cameraPositions[];
  
  float averageX;
  float averageY;
  
  ArrayList<CameraStarInfo> stars = new ArrayList<CameraStarInfo>();
  
  CameraStars (Vec2 centralPoint)
  {
    cameraPositions = loadStrings("cameraPositions.txt");
    time = 60 * 10;
    this.centralPoint = centralPoint;
    
    averageX=0;
    averageY=0;
    
    for (int i = 0; i < cameraPositions.length; i++)
    {
      CameraStarInfo star = new CameraStarInfo();
      
      // Remove I and \t
      cameraPositions[i] = cameraPositions[i].substring(2, cameraPositions[i].length());
      
      // Parse time
      String minute[] = cameraPositions[i].split(":", 2);
      String second[] = minute[1].split("\t", 2);
      
      // Assign time
      star.time = Float.parseFloat(minute[0]) * 60 + Float.parseFloat(second[0]);
      
      // Parse player
      String player[] = second[1].split("\t", 2);
      
      if (player[0].equals("Life"))
      {
        star.isLife = true;
      }
      else
      {
        star.isLife = false;
      }
      
      // Remove cameraupdate, \t, x, =
      player[1] = player[1].substring(15, player[1].length());
      
      // Parse X position
      String positionX[] = player[1].split(";",2);
      
      star.x = Float.parseFloat(positionX[0]);
      
      // Remove y=
      positionX[1] = positionX[1].substring(3, positionX[1].length());
      
      // Parse Y position
      star.y = Float.parseFloat(positionX[1]);
      
      averageX += star.x;
      averageY += star.y;
      
      stars.add(star);
    }
    
    averageX /= cameraPositions.length;
    averageY /= cameraPositions.length;
  }
  
  void update()
  {
    time++;
    
    CameraStarInfo currentStar = stars.get(starIndex);
     // println(stars.get(starIndex).time);
    
    if(time/60 > currentStar.time)
    {
      noFill();
      if(currentStar.isLife)
      {
        stroke(240,130,130,40);
      }
      else
      {
        stroke(130,130,240,40);
      }
      ellipse(centralPoint.x + currentStar.x - averageX, centralPoint.y + currentStar.y - averageY, 10, 10);
      starIndex++;
    }
    
    
  }
} 

