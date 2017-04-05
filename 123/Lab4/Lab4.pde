float cx, cy, dx = 1, dy = 1;
float score = 0;
float mouseclicks = -1;
float accuracy;
color textcolor = color(255);
float speed = 1;
boolean initpress = false;
int start_time;
PFont f;
PImage img;

void setup(){
  size(400, 400);
  cx = 200;
  cy = 200;
  rectMode(CENTER);
  background(0);
  f = createFont("Times New Roman", 16, true);
  
  //Title Screen
  img = loadImage("Title Screen.png");
  image(img, 0, 0);
}

void draw(){
  if (initpress && mouseclicks < 1){
    start_time = second();
  }
  if (initpress){
    //Main game loop
    //After 10 seconds, the game will stop
    if (abs(second() - start_time) <= 30){
      background(0);
      //At 10 seconds, epilepsy starts
      if (abs(second() - start_time) > 20){
        textcolor = color(255, 0, 0);
        background(random(255));
      }
      pushMatrix();
        translate(cx, cy);
        //Draw box
        fill(0, 180, 0);
        rect(0, 0, 50, 50);
      popMatrix();
      
      //Score and Time
      fill(textcolor);
      textFont(f, 24);
      text("Score:", 0, 24);
      text(int(score), 65, 24);
      text("Time:", 315, 24);
      text(int(30 - abs(second() - start_time)), 375, 24);
      
      //Movement
      cy += dy;
      cx += dx;
      
      //Check bounds
      if (cx < 25 || cx > width - 25){
        dx = -dx;
      }
      
      if (cy < 25 || cy > height - 25){
        dy = -dy;
      }
      
    }
    else{
      gameOver();
      noLoop();
    }
  }
}

void gameOver(){
  background(0);
  fill(255, 0, 0);
  textFont(f, 32);
  text("Game Over", 0, 32);
  textFont(f, 16);
  fill(255);
  text("Score:", 0, 32*2);
  text(int(score), 45, 32*2);
  text("Clicks:", 0, 32*3);
  text(int(mouseclicks), 50, 32*3);
  text("Accuracy:", 0, 32*4);
  text(int(accuracy), 70, 32*4);
  text("%", 85, 32*4);
}

void mousePressed(){
  mouseclicks++;
  speed += .1;
  initpress = true;
  //If click in box, increase score
  if (mouseX > cx - 25 && mouseX < cx + 25 && mouseY > cy - 25 && mouseY < cy + 25){
    score++;
  }
  
  accuracy = score/mouseclicks*100;
  
  dx = random(-5, 5)*speed;
  dy = random(-5, 5)*speed;
}
