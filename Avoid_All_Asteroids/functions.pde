void changeCargoHue(){
  cargoHue+=27;
    if(cargoHue > 255){
      cargoHue-= 256;
    }
}

void createMainFont(){
  mainFont = createFont("Audiowide-Regular.ttf", 32);
  textFont(mainFont);
  fontLoaded = true;
}

void toggleGameAndMenu(MenuType ...menuType){
  if(game == true){
    game = false;
    menu = true;
    for(int i = 0; i < menuType.length; i++){
      menuType[i].isActive = true;
    }
    currentMenu = menuType[0];
    
  }else{
    game = true;
    menu = false;
    for(int i = 0; i < menuType.length; i++){
      menuType[i].isActive = false;
    }
  }
  println("Game: " + game);
  println("Menu: " + menu);
  printArray(menuType);
}


void loadHighscores(){
  highscoreList = loadStrings("highscore.txt");
  //printArray(highscoreList);
  for(int i = 0; i < highscoreList.length; i++){
    String[] highscore = split(highscoreList[i], ": ");
    highscoreKeyValues.add(highscore);
  }
  sortHighscores();
}

void addHighscore(String name, String score){
  boolean hasHighscore = false;
  String[] newScore = {name, score};
  for(int i = 0; i< highscoreKeyValues.size(); i++){
    String[] currentScore = highscoreKeyValues.get(i);
    if(currentScore[0].equals( newScore[0])){
      if(float(currentScore[1]) > float(newScore[1])){
        highscoreKeyValues.set(i, newScore);
      }
      hasHighscore = true;
    }
  }
  if(!hasHighscore){
    highscoreKeyValues.add(newScore);
  }
  
  sortHighscores();
  String[] highscoreList_temp = new String[highscoreKeyValues.size()];
  for(int i = 0; i < highscoreKeyValues.size(); i ++){
    highscoreList_temp[i] = join(highscoreKeyValues.get(i), ": ");
  }
  highscoreList = highscoreList_temp;
  printArray(highscoreList);
}

void sortHighscores(){
  if(highscoreList.length != 0 && highscoreKeyValues.size() > 1){
    for(int j = 0; j < highscoreKeyValues.size(); j++){
      for(int i = 0; i < highscoreKeyValues.size() -1; i ++){
        String[] currentEntry = highscoreKeyValues.get(i);
        String[] nextEntry = highscoreKeyValues.get(i+1);
        if(float(currentEntry[1]) > float(nextEntry[1])){     
          highscoreKeyValues.set(i + 1, currentEntry);
          highscoreKeyValues.set(i, nextEntry);
        }
      }
    }
  }
  for(int i = 0; i < highscoreKeyValues.size(); i ++){
    printArray(highscoreKeyValues.get(i));
  }
}

void saveHighscores(){
  saveStrings("highscore.txt", highscoreList);
}

void loadContent(){
  createMainFont();
  loadImages();
  loadHighscores();
  
}

void loadImages(){
  for(int i = 0; i < asteroidImages.length; i++){
    String asteroidImageName = "asteroid-" + i + ".png";
    asteroidImages[i] = loadImage(asteroidImageName);
  }
  
}
