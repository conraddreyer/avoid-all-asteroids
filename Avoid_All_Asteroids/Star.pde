class Star{
  PVector pos;
  int starWidth;
  color col = color(255, 255, 230, 100);
  int lifespan; //Zeit in Millisekunden!
  int lifetimer; //Zeit in Millisekunden!
  
  Star(PVector _pos, int _starWidth, int _lifespan){
    pos = _pos;
    starWidth = _starWidth;
    lifespan = _lifespan;
    lifetimer = millis() + lifespan;
  }
  
  void displayStar(){
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, starWidth, starWidth);
  }
  
  void supernova(){
    if(millis() > lifetimer){
      
      pos.x = int(random(0, width));
      pos.y = int(random(0, height));
      lifetimer= millis() + lifespan;
    }
  }
}

void drawStars(){
  for(int i = 0; i< stars.length; i++){
    stars[i].supernova();
    stars[i].displayStar();
  }
}
