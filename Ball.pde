class Ball {

//change attention level per level
int changeAttention;
//Text changes adding 1
int changeLevel;

//selects random colour for the ball on start-up
color c1;
//Ball positon
int xPos;
int yPos;

//stops the ball from moving if it hits the top of the screen or the bottom
int yWallTop;
int yWallBottom;

//checks that processing is recieving data from mindset before moving ball
boolean checkThinkgear;

PFont font2;
//Contructor
Ball() {
  c1 = color(random(255),random (1255),random (255));
//Waits for data to be recieved
  checkThinkgear = false;
//Attention starts at 20 and then plus 10 everythime ball touches the top of the screen
  changeAttention = 20;
  changeLevel = 1;
 
//Balls position
  xPos = width/2;
  yPos = height - 30;
//Wall
  yWallTop = 0 + 30;
  yWallBottom = height - 30;  
  
  font2 = loadFont ("Dialog.plain-48.vlw");
    
 }


//Method
void update() {
   changeLevel();
   hitWall();
   ball();
   moveBallUp();
 }
  
  
void moveBallUp () {
  if (!checkThinkgear) {
    textFont (font2, 40);
    fill(255,0,0);
    text("Wait", 5, 50);
    return;
  }
  if (attention >= changeAttention) {
   yPos--;
   textFont (font2, 40);
    fill(0,255,0);
    text("Go", 5, 50);
  }  
  else {
   yPos++; 
  }
}

void ball () {
  fill (c1);
  ellipse(xPos, yPos, 60, 60);
}

void hitWall() {
  
    //WallTop
  if (yPos <= yWallTop) {
    yPos = height - 30;
    changeAttention = changeAttention + 10;
  }
    //WallBottom
  if (yPos >= yWallBottom) {
    yPos--;
  }
}

 
//Ball hits top then adds 1 to level with increased difficulty  
 void changeLevel() {
  if (yPos <= yWallTop) {
   changeLevel = changeLevel + 1;
  } 
 }
}
