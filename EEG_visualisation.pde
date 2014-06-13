/*
The Focus ball
Author: Braeden Foster
About: Ball Floats to top of window based on the Level of your focus.
When the ball reaches the top of the screen the Level increases 
and makes the attention level higher.
Version: 1.1
Date: 21/04/2014
*/
import processing.video.*;
import neurosky.*;
import org.json.*;
import java.net.*;

ThinkGearSocket neuroSocket;

//Thinkgear brainwave averages
int attention = 0;
int meditation = 0;
int blinkSt = 0;
int blink = 0;

PFont font;

Ball myBall;
Capture cap;

void setup() {
  size(640, 480);
 
 //creates instance of ball
  myBall = new Ball();
  font = loadFont ("Dialog.plain-48.vlw");
  
    ThinkGearSocket neuroSocket = new ThinkGearSocket(this);
      try 
  {
    neuroSocket.start();
  } 
  catch (ConnectException e) {
    e.printStackTrace();
  }
    frameRate(25);
    cap = new Capture(this, width, height);
    
}

void draw() {
  //Sets background to white
    background(255);
    noStroke();
    
    //console data refrence
    println("attention = " + attention);
    println("meditation = " + meditation);
    println("blink = " + blink);
    println("xPos = " + myBall.xPos);
    println("yPos = " + myBall.yPos);
    println("Change Attention = " + myBall.changeAttention); 
    
    //level text updates when ball hits top of screen by incrementing by one.
    textFont (font, 30);
    fill (0);    
    text ("Level = " + myBall.changeLevel, 500, 50);  
    
    //calls ball class methods
    myBall.update();    
    
}



//This section initialises the socket feed for the mindset
void captureEvent(Capture _c) 
{
  _c.read();
 
}
void blinkEvent(int blinkStrength) 
{
  blinkSt = blinkStrength;
  blink = 1;
}

void attentionEvent(int attentionLevel) 
{
  if (attentionLevel>=20) myBall.checkThinkgear = true; 
  attention = attentionLevel;
 
}  
void meditationEvent(int meditationLevel) 
{
  meditation = meditationLevel;
}

void rawEvent(int[] raw) {
 println("rawEvent Level: " + raw);
}

public void eegEvent(int delta, int theta, int low_alpha, int high_alpha, int low_beta, int high_beta, int low_gamma, int mid_gamma) {
  println("delta Level: " + delta);
  println("theta Level: " + theta);
  println("low_alpha Level: " + low_alpha);
  println("high_alpha Level: " + high_alpha);
  println("low_beta Level: " + low_beta);
  println("high_beta Level: " + high_beta);
  println("low_gamma Level: " + low_gamma);
  println("mid_gamma Level: " + mid_gamma);
}
