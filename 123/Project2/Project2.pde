PFont f;
int click_count = 0;

float size = 1;
int move = 0;
float rotation = 0;
int pos = 550;

void setup(){
  size(450, 450);
  background(0);
  f = createFont("Arial", 16, true);
}

void draw(){
  if (click_count == 0){
    drawTitleScreen();
  }
  if (click_count == 1){
    drawMain();
  }
  if (click_count == 2){
    drawMain();
    if (size > .7){
      size -= .002;
    }
  }
  if (click_count == 3){
    drawMain();
    if (pos >0){
      pos -= 2;
    }
  }
  if (click_count == 4){
    drawMain();
    if (rotation <= .25*PI){
      rotation += .1;
    }
    fill(0);
    textFont(f, 35);
    text("Hello", 205, 335);
  }
  if (click_count == 5){
    background(0);
    fill(255);
    textFont(f, 16);
    text("end of program", 170, 225);
  }
}

void drawTitleScreen(){
  textFont(f, 16);
  background(0);
  text("Social Interactions", 150, 225);
  text("By Devon Martin", 150, 245);
}

void drawMain(){
  background(255);
  pushMatrix();
    scale(size);
    
    //Face
    fill(255, 255, 0);
    ellipse(225, 225, 420, 420);
    fill(0);
    ellipse(150, 150, 35, 130);
    ellipse(300, 150, 35, 130);
    fill(255);
    noStroke();
    ellipse(155, 100, 20, 20);
    ellipse(305, 100, 20, 20);
    fill(0);
    arc(225, 300, 65, 65, 0, PI);
    
    //Hand
    pushMatrix();
      translate(0, pos);
      pushMatrix();
        translate(530, 266);
        rotate(rotation);
        fill(255);
        stroke(0);
        strokeWeight(5);
        arc(500 - 530, 160 - 266, 30, 40, PI, TWO_PI);
        arc(530 - 530, 146 - 266, 30, 40, PI, TWO_PI);
        arc(560 - 530, 160 - 266, 30, 40, PI, TWO_PI);
        arc(587 - 530, 185 - 266, 24, 40, PI, TWO_PI);
        line(485 - 530, 160 - 266, 485 - 530, 225 - 266);
        line(515 - 530, 146 - 266, 515 - 530, 225 - 266);
        line(545 - 530, 146 - 266, 545 - 530, 225 - 266);
        line(575 - 530, 160 - 266, 575 - 530, 235 - 266);
        line(599 - 530, 185 - 266, 599 - 530, 285 - 266);
        arc(467 - 530, 235 - 266, 40, 40, .85*PI, 1.85*PI);
        line(484 - 530, 224 - 266, 500 - 530, 254 - 266);
        line(450 - 530, 244 - 266, 470 - 530, 288 - 266);
        arc(535 - 530, 285 - 266, 128, 50, 0, .95*PI);
      popMatrix();
    popMatrix();
  popMatrix();
}

void mousePressed(){
  click_count++;
  println(click_count);
  //println(mouseX, mouseY);
}
