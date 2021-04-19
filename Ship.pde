class Ship{
   // The Mover tracks location, velocity, and acceleration 
  PVector pos;
  PVector speed;
  float acceleration;
  PVector dir;
  float topspeed;
  int shipWidth;
  boolean isColliding;
  boolean updateStatus;
  int hitcounter;
  int hitID;
  boolean loaded;
  float theta;
  PVector lastKnownLocation;
  float hitbox;
  color[] flamecolors = { color(255,90,0), color(255,154,0), color(255,206,0), color(255,232,8)};
  
  
  
  Ship(float x_, float y_, int topSpeed_, float acceleration_, int shipWidth_, float hitbox_){
    pos = new PVector(x_,y_);
    speed = new PVector(0,0);
    dir = new PVector(0,0);
    lastKnownLocation = new PVector(0,0);
    topspeed = topSpeed_;
    acceleration = acceleration_;
    shipWidth = shipWidth_;
    loaded = false;
    hitbox = hitbox_;
    isColliding = false;
    updateStatus = true;
    hitcounter = 0;
  }
  
  void update() {  
    dir = new PVector(0,0);   
      if(isUp){
         dir.y -= acceleration;
      }
      if(isDown){
         dir.y += acceleration;
      }
      if(isLeft){
         dir.x -= acceleration;
      }
      if(isRight){
         dir.x += acceleration; 
      }
 
    speed.add(dir);
    speed.limit(topspeed);
    
    updateStatus = true;
    
    if(pos.x > width - shipWidth/2){
      pos.x = width - shipWidth/2 -1;
      keepStatus();
    }
    if(pos.x < shipWidth/2){
      pos.x = shipWidth/2 +1;
      keepStatus();
    }
    if(pos.y > height - shipWidth/2){
      pos.y = height - shipWidth/2 -1;
      keepStatus();
    }
    if(pos.y < shipWidth/2){
      pos.y = shipWidth/2 +1 ;
      keepStatus();
    }
    if(isColliding){
      keepStatus();
    }
    if(speed.x == 0 && speed.y == 0){
      keepStatus();
    }
    
    if(updateStatus){
      lastKnownLocation = speed;
      theta = lastKnownLocation.heading();   
    }
    
    pos.add(speed);
  }
  
  void keepStatus(){
    speed.mult(0);
    updateStatus = false;
  }
  
  void display() {
    if(showShipHitbox){
      noFill();
      stroke(255,0,0);
      ellipse(pos.x, pos.y, hitbox,hitbox); 
    }
     colorMode(RGB);
     stroke(190);
     fill(127);
     
    pushMatrix();
    translate(pos.x,pos.y); 
    rotate(theta);
    
    triangle(shipWidth/2, 0, -shipWidth/2, shipWidth/2, -shipWidth/2, -shipWidth/2);
    rectMode(CENTER);
    noStroke();
    if(isColliding){
      noFill();
    }else{
      fill(flamecolors[frameCount % 4]);
    }
    
    triangle(-shipWidth/2-10-frameCount%5*1.5, 0, -shipWidth/2, shipWidth/2, -shipWidth/2, -shipWidth/2);
    stroke(190);
    fill(127);
    rect(-shipWidth/2 - 2, 0, 4, shipWidth -2); 
    if(loaded){ 
      strokeWeight(2);
      colorMode(HSB);
      fill(cargoHue, 255, 255);
      stroke(cargoHue, 255, 255);
    }else{
      colorMode(RGB);
      noStroke();
      fill(200);
    }
    ellipse(0,0, 5,5);
    popMatrix();
    colorMode(RGB);
      fill(127);
      stroke(0,180,220);
  }
  
  void checkCollision(Asteroid asteroid){ 
     if(dist(this.pos.x, this.pos.y, asteroid.pos.x, asteroid.pos.y) < asteroid.size/2 + this.hitbox/2){
       this.isColliding = true; 
       if(this.hitID != asteroid.id){
         hitcounter++;
         this.hitID = asteroid.id;
         println("hitcounter: " + hitcounter);
         println("hitId: " + hitID);
         println("asterodiID: " + asteroid.id); 
       }else{
         println("Same Asteroid: " + hitID);
       }
     } 
    }
  
    void toggleFreight(){
      if(loaded && dist(this.pos.x, this.pos.y, homebase.pos.x, homebase.pos.y) < baseWidth/2 + this.shipWidth/2){
        
          loaded = false;
          delivered++;
          goodStuff();
          resetRound();
          println("unloaded");
        
      }else{
        if(dist(this.pos.x, this.pos.y, orbitbase.pos.x, orbitbase.pos.y) < baseWidth/2 + this.shipWidth/2){
          loaded = true;
          println("loaded");
        }
      }
      
    }
  
  void goodStuff(){
    acceleration *= plusAcceleration;
    topspeed *= plusTopspeed;
  }
  
  
}
