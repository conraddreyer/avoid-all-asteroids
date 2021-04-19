void showMenu(MenuType menuType){
  menuBackground();
  if(fontLoaded){
    colorMode(RGB);
    fill(255);
    text(menuType.txt , menuLeftAlign, h[40]);
    if(menuType.showsCargo){
      text("Cargo transported: " + delivered, menuLeftAlign, h[50]);
    }
    if(menuType.showsTime){
      text("Time: " + gameDuration + " seconds", menuLeftAlign, h[60]);
    }
    if(menuType.allowsInput){
      
      text(username + "|" , menuLeftAlign, h[50]);
      stroke(255);
      for(int i = 0; i<3; i++){
        int xOffset = i * 30;
      line(menuLeftAlign + xOffset, usernameInputLineHeight, menuLeftAlign + 25 + xOffset, usernameInputLineHeight);
      }
    }
    if(menuType.enablesPressEnter && username.length() >2){
        showPressEnterMessage();
      } 
    scoreBoard();
   }else{
     loadingAnimation();
   }
}

void menuBackground(){
  colorMode(HSB);
  fill(0,0,0,180);
  stroke(cargoHue,127,127);
  rectMode(CENTER);
  rect(w[50], h[50], w[75], h[66]);
}

void loadingAnimation(){
  for(int i = 0; i < 3; i++){
    colorMode(HSB);
    fill(cargoHue + i * 27 , 200,200);
    noStroke();
    ellipse(w[50] - 30 + 30 * i, h[50], 15, 15);
    colorMode(RGB);
  } 
}

void menuKeyHandler(){
    if(currentMenu.allowsInput && key!= CODED){    
      switch(key){
        case BACKSPACE:
          if(username.length() > 0){
            username = username.substring(0, username.length() - 1);  
          } 
          break;
         case ENTER:
           if(username.length() >= 3){
            resetGame(); 
            }
            break;
          default: 
            if(username.length() < 3){
              username += key;
              username = username.toUpperCase();
            }
            break; 
        }
    }else{
      if(key == ENTER){
        resetGame(); 
      }
    }
}

void showPressEnterMessage(){
  colorMode(HSB);
  fill(cargoHue, 255,255);
  text("Press Enter to play", menuLeftAlign, h[60]);
  colorMode(RGB);
}

void scoreBoard(){
  
  for(int i = 0; i< highscoreKeyValues.size(); i++){
    if(i <= 9){
      String[] currentScore = highscoreKeyValues.get(i);
      if(currentScore[0].equals( username)){
        colorMode(HSB);
        fill(cargoHue,255,255);
      }else{
        fill(255);
      }
      textSize(16);
      textAlign(LEFT, CENTER);
      text((i+1) + ") " + highscoreList[i], menuMiddleAlignX, h[27] + h[5] * i);
    }
  }
  
  colorMode(RGB);
  textSize(32);
  textAlign(LEFT, BOTTOM);
  fill(255);
}
