void showGame(){
  
  showBase();
  collisionCheckFrame = false;
  if(frameCount % collisionAmount == 0){
   collisionCheckFrame = true;
   lol.isColliding = false;
   deleteAsteroids();
   
   }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);
    if(collisionCheckFrame){
      
      asteroid.checkDeath();
      lol.checkCollision(asteroid); 
      
    }
    asteroid.update();
    asteroid.display();
  }
  
  lol.update();
  lol.toggleFreight();
  lol.display();
  
  showTransportedCargo();
  showTime();
  
}

void deleteAsteroids(){
  for(int i = 0; i< cleanUpAsteroids.size(); i++){
    createAsteroid(cleanUpAsteroids.get(i));
  }
  cleanUpAsteroids.clear();
  
}


boolean setMove(int code, boolean b) {
  switch (code) {
  case UP:
    return isUp = b;
 
  case DOWN:
    return isDown = b;
 
  case LEFT:
    return isLeft = b;
 
  case RIGHT:
    return isRight = b;
 
  default:
    return b;
  }
}

void showBase(){
  homebase.display();
  orbitbase.display();
}

void showTransportedCargo(){
  for(int i = delivered; i > 0; i--){
    stroke(0,180,220,100);
    colorMode(HSB);
    int thisHue = cargoHue + i * 32 % 256;
    if(thisHue > 255){
      thisHue = thisHue - 255;
    }
    
    fill(thisHue, 255,255);
    rect(30*i + 30, 30, 15, 15);
  }
  colorMode(RGB);
}

void showTime(){
 
 millisecondsLeft = roundEnd - millis();
 secondsLeft = int(millisecondsLeft/1000);
 tutorialTimeframe = roundEnd - millisecondsLeft - gameStart;
 if( tutorialTimeframe < 10000 && firstTry){
   if( tutorialTimeframe < 5000){
     tutorialAlpha = 255;
   }else{
     tutorialAlpha = int(map(tutorialTimeframe,10000, 5000, 0, 256));
   }
   
   
   
   fill(255, tutorialAlpha);
   textAlign(CENTER);
   textSize(30);
   text("Move " + winDelivered + " cargo pieces from right base to left base!\n Use arrow keys! ", w[50], h[45]);
 }
 
 colorMode(RGB);
 fill(0, 200);
 textSize(15);
 if(secondsLeft <= 5){
   colorMode(HSB);
   stroke(cargoHue, 255, 255);
 }else{
   stroke(0,180,220);
 }
 rectMode(CORNER);
 textAlign(LEFT, BASELINE);
 String secondsText = "Time left for Round: " + secondsLeft;
 rect(w[73], 10, textWidth(secondsText) + w[2], 30);
 fill(255);
 text(secondsText, w[74], 30);
 
 if(secondsLeft <= 0){
    toggleGameAndMenu(failMenu);  
    firstTry = false;
 }
 
 colorMode(RGB);
}

void resetRound(){
  roundDuration = int(initialRoundDuration / (1 + delivered * 0.5));
  
  if(delivered >= winDelivered){
    gameDuration = nf((millis() - gameStart)*0.001, 0, 2).replace(',', '.').replace(' ', ',');
    toggleGameAndMenu(victoryMenu);
    addHighscore(username, gameDuration);
    saveHighscores();
    firstTry = false;
    
  }
  roundEnd = millis() + roundDuration;
}

void resetGame(){
    asteroids.clear();
    isUp = false;
    isDown = false;
    isLeft = false;
    isRight = false;
    delivered = 0;
    gameStart = millis();
    lol = new Ship(homebase.pos.x - 10, homebase.pos.y, initShipTopspeed, initShipAcceleration, initShipWidth, shipHitbox);
    for(int i = 0; i < asteroidNumber; i++){
      createAsteroid();
    }
    toggleGameAndMenu(victoryMenu, failMenu, startMenu);
    println("victoryMenu: " + victoryMenu);
    println("failMenu: " + failMenu);
    println("startMenu: " + startMenu);

    resetRound();
}
