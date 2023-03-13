
Image background = new Image();
Image ariel = new Image();
Image fish = new Image();
Image life1= new Image();
Image life2= new Image();
Image life3= new Image();
Image gameOver = new Image();
Image win = new Image();
Text txtPoints= new Text();
SplashScreen scr = new SplashScreen();

int lifeCount = 3;
int points = 0;

Music musicBg = new Music();
Music musicSuccess = new Music();
Music musicLose = new Music();


void setup() {
  size(1020, 600);
  musicBg.load("Under_the_Sea.mp3");
  musicBg.loop = true;
  musicSuccess.load("success.mp3");
  musicLose.load("lose.mp3");
  musicBg.play(); 
  setShowScreen();
  setBackground();
  setAriel();
  setFish();
  setLife();
  setTxtPoints();
  setGameOver();
  setWin();
}

void setBackground() {
  background.setImage("sea.jpg");
  background.width = 1024;
  background.height = 600;
} 

void setShowScreen(){
 scr.gameName = "Under The Sea";
 //scr.backgroundColor = color(0,0,0);
 scr.gameAuthor1 = "Hadar Tayar";
 scr.gameAuthor2 = "";
 scr.image = "ariel2.png";
}

void setAriel() {
  ariel.setImage("ariel.png");
  ariel.x = 430;
  ariel.y = 420;
  ariel.width = 130;
  ariel.height = 170; 
}

void setFish() {
  fish.setImage("fish.png");
  fish.x = 450;
  fish.y = 30;
  fish.width = 120;
  fish.height = 80; 
}

void moveDownFish() {
  fish.direction = Direction.DOWN;
  fish.speed = 10;

  if (fish.y >= 490) {
    fish.speed = 0;
    fish.y = 50;
    fish.x= (int)random(10, 970);
  }
}

void setLife() {
  life1.setImage("life2.png");
  life1.x = 30;
  life1.y = 20;
  life1.width = 70;
  life1.height = 70; 
  life2.setImage("life2.png");
  life2.x = 80;
  life2.y = 20;
  life2.width = 70;
  life2.height = 70; 
  life3.setImage("life2.png");
  life3.x = 130;
  life3.y = 20;
  life3.width = 70;
  life3.height = 70; 
}

void setTxtPoints(){
  txtPoints.x= 900;
  txtPoints.y= 50;
  txtPoints.brush = color(255,255,255);
  txtPoints.alpha = 255;
  txtPoints.text = "Points: " + points;
  txtPoints.textSize = 20;
  txtPoints.font= "david";
}

void setGameOver(){
  gameOver.setImage("gameOver.png");
  gameOver.width = 1024;
  gameOver.height = 600;
}

void setWin(){
  win.setImage("win.jpg");
  win.width = 1024;
  win.height = 600;
}

void success(){
  musicSuccess.play();
  points++;
  txtPoints.text = "Points: " + points;
  fish.y= 30;
}

void lose(){
  musicLose.play();
  lifeCount--;
}

void draw() {
  background.draw();
  scr.show();

  if(scr.show()== false){
    ariel.x= mouseX;
    ariel.draw();
    fish.draw(); 
    txtPoints.draw();
    moveDownFish();
    
    if(lifeCount >= 1 )
      life1.draw();
    if(lifeCount >= 2)
      life2.draw();
    if(lifeCount >= 3)
      life3.draw();
      
     //Game Over
    if(lifeCount == 0){
      gameOver.draw();
      fish.speed = 0;
    }
    
    //You Win
    if(points == 10){
      win.draw();
      fish.speed = 0;
    }
    
     //If Ariel catch the fish
      if(fish.pointInShape(ariel.x, ariel.y))
        success();
      else if(fish.y == 480){
        lose();
      }
  } 
}

void keyPressed(){
  if(keyCode == RIGHT){
    if(ariel.x < 910)
      ariel.x= ariel.x + 7;
  } 
  else if(keyCode == LEFT){
    if(ariel.x >= 0)
      ariel.x= ariel.x - 7;
  } 
}
  
