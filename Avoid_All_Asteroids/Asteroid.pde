class Asteroid{
  int size;
  int topspeed;
  PVector pos;
  PVector dir;
  PVector speed;
  int id;
  float rot;
  float rotIncrement;
  PImage asteroidImage;
  boolean isDead = false;
  
  Asteroid(PVector pos_, PVector dir_, PVector speed_, int size_, float rotIncrement_, int topspeed_, int id_, PImage asteroidImage_){
  size = size_;
  rot = 0;
  rotIncrement = rotIncrement_;
  pos = pos_;
  dir = dir_;
  speed = speed_;
  topspeed = topspeed_;
  id = id_;
  asteroidImage = asteroidImage_;
  }
  
  void update(){
    speed.add(dir);
    speed.limit(topspeed);
    pos.add(speed);
    rot += rotIncrement;
  } 
  
  void checkDeath(){
    if(pos.y > height){
      isDead = true;
      cleanUpAsteroids.add(this);
    }
  }
  
  void display(){
    /*
    stroke(181, 138, 94);
    strokeWeight(2);
    fill(79, 44, 19);
    ellipse(pos.x,pos.y,size,size);
    */
    pushMatrix();
    translate(pos.x,pos.y);
    imageMode(CENTER);
    rotate(radians(rot));
    image(asteroidImage,0,0,size,size);
    popMatrix();
    
  }
}


void createAsteroid(Asteroid... astero){
  int asteroidSize = int(random(w[5], w[10]));
  int asteroidTopspeed = int(random(2, 15)); //30; @30fps
  PVector asteroidPosition = new PVector(random(baseWidth + asteroidSize/2, width - baseWidth - asteroidSize/2), 0 - asteroidSize);
  PVector asteroidDirection = new PVector(0, (asteroidTopspeed * 0.001));
  PVector asteroidSpeed = new PVector(0, 0);
  PImage currentAsteroidImage = asteroidImages[asteroidImageCounter % 3];
  int asteroidRotationDirection =random(1)>0.5?1:-1;
  float asteroidRotation = (50.0 / asteroidSize) * asteroidRotationDirection;
  
  if(asteroids.size() < asteroidNumber){
      asteroids.add(new Asteroid(asteroidPosition, asteroidDirection, asteroidSpeed, asteroidSize, asteroidRotation, asteroidTopspeed, asteroidId, currentAsteroidImage));
      asteroidId++;
      asteroidImageCounter++;
  }else{
    for(int i = 0; i < astero.length; i++){
      astero[i].pos = asteroidPosition;
      astero[i].dir = asteroidDirection;
      astero[i].speed = asteroidSpeed;
      astero[i].size = asteroidSize;
      astero[i].rot = asteroidRotation;
      astero[i].topspeed = asteroidTopspeed;
    }
    
    
  }
  
}
