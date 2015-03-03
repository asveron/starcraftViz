class CommandPrint
{ 
  float time;
  Vec2 centralPoint;
  
  int starIndex;
  String cameraPositions[];
  
  float averageX;
  float averageY;
  
  ArrayList<String> commands = new ArrayList<String>();
  ArrayList<CameraStarInfo> stars = new ArrayList<CameraStarInfo>();
  
  CommandPrint (Vec2 centralPoint)
  {
    cameraPositions = loadStrings("commandPrint.txt");
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
      String command = player[1].substring(4, player[1].length());
      
      stars.add(star);
      println(command);
      commands.add(command);
    }
  }
  
  void update(float a)
  {
    time++;
    translate(centralPoint.x,centralPoint.y);
    pushMatrix();
    rotate(a - 0.5*PI);
    CameraStarInfo currentStar = stars.get(starIndex);
    noFill();
    if(currentStar.isLife)
    {
      fill(240,180,180,8);
    }
    else
    {
      fill(180,180,240,8);
    }
    if(time/60 > currentStar.time)
    {
      text(commands.get(starIndex),0,0);
      //rotate();
      starIndex++;
    }
    popMatrix();
    
    translate(-centralPoint.x,-centralPoint.y);
  }
} 

