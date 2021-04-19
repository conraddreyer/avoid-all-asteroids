//Grid 
float w[] = new float[100];
float h[] = new float[100];

//Ship
Ship lol; //Low Orbit Lander
boolean isLeft, isRight, isUp, isDown;
float initShipAcceleration = 0.45/2; // 0.45; @30fps
int initShipTopspeed = 2; //4; @30fps
int initShipWidth = 20;
float plusAcceleration = 1.5;
float plusTopspeed = 1.5;
float shipHitbox = 1.7 * initShipWidth;
boolean showShipHitbox = false;

//Asteroids
int asteroidNumber = 10;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Asteroid> cleanUpAsteroids = new ArrayList<Asteroid>();
int asteroidId = 0;
int asteroidImagesNumber = 3;
PImage[] asteroidImages = new PImage[asteroidImagesNumber];
int asteroidImageCounter = 0;
IntList asteroidCleanUp;


//Base & BG
Base homebase;
Base orbitbase;
int baseWidth = 60;
int starCount = 100;
Star[] stars = new Star[starCount];

//Game
int winDelivered = 4; //How much cargo until you win?
int delivered = 0;
int initialRoundDuration = 30000; //milliseconds for round
int collisionAmount = 10; //  30/collisionAmount determines, how often per Second collisionCheckFrame is true
boolean collisionCheckFrame = false; // if is true, collision detection hits
int cargoHue = 0;
int secondsLeft = 1;
int millisecondsLeft =1;
int roundDuration;
int roundEnd;
boolean firstTry = true;
int tutorialTimeframe;
int tutorialAlpha = 255;
int gameStart; 
String username = "";
String gameDuration;
boolean game = false;



//Menu
String enterMessage = "";
boolean menu = true;
MenuType startMenu = new MenuType("Input username:", true, false, false, true, true);
MenuType failMenu = new MenuType("You Failed.", false, false, true, true, false);
MenuType victoryMenu = new MenuType("You Win!", false, true, true, false, false);
MenuType currentMenu = startMenu;
float menuLeftAlign;
float menuMiddleAlignX;
float usernameInputLineHeight;


//Loading
PFont mainFont;
boolean fontLoading = false;
boolean fontLoaded = false;
boolean contentLoading = false;
String[] highscoreList;
ArrayList<String[]> highscoreKeyValues = new ArrayList<String[]>();
