void setup(){
  size(1000,500, P2D);
  //fullScreen(P2D);
  pixelDensity(displayDensity());
  frameRate(60);
  smooth(8);
  frame.setTitle("Avoid All Asteroids");
  
  for(int i = 0; i < 100; i++){
    w[i] = i * 0.01 * width;
    h[i] = i * 0.01 * height;
  }
  
  
  homebase = new Base(0, h[50], baseWidth);
  
  orbitbase = new Base(width, h[50], baseWidth);
  
  for(int i =0; i < starCount; i++){
    PVector sternenPosition = new PVector();
    sternenPosition.x = int(random(0, width));
    sternenPosition.y = int(random(0, height));
    int sternenDurchmesser = int(random (2,5));
    int sternenLeben = int(random(500,1500));
    stars[i] = new Star(sternenPosition, sternenDurchmesser, sternenLeben);
  }
  
  menuLeftAlign = w[20];
  menuMiddleAlignX = w[65];
  usernameInputLineHeight = h[50];
  
}

void draw(){
  background(2,20,26);
  frame.setTitle(int(frameRate) + " fps");
  drawStars();
  changeCargoHue();
 
  if(game){
    showGame();
  }
  
  if(menu){
    if(!contentLoading){
        thread("loadContent");
        contentLoading = true;
    }
    showMenu(currentMenu);
  }  
}

void keyPressed() {
  if(game){
    setMove(keyCode, true);
  }
  if(menu && fontLoaded){
    menuKeyHandler();
  }
}
 
void keyReleased() {
  if(game){
    setMove(keyCode, false);
  }
}
