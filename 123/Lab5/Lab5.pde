//Creates arrays that holds information for all of the randomly generated stars
float[] starx = new float[0];
float[] stary = new float[0];
int[] starlines = new int[0];

void setup(){
  size(800, 400);
  //Draws the gradient background
  //background(90, 36, 126);
  for (int i = 0; i < 400; i += 5){
    noStroke();
    fill(100 - 2*i/5, 36 - 2*i/5, 126 - 2*i/5);
    rect(0, 400 - i, 800, -5);
  }
  //Creates random buildings
  drawBuildings();
  
  //First: draws black shadow of star; second: draws white star on top
  for (int i = 0; i < 100; i++){
    drawStars(random(800), random(200), int(random(20, 30)), 0);
  }
  for (int i = 0; i < 100; i++){
    drawStars(starx[i] + 5, stary[i] - 5, starlines[i], 220);
  }
}

void draw(){
  
}

//Creates randomly generated stars
void drawBuildings(){
  for (int i = 0; i < 800; i += 20){
    fill(0);
    stroke(0);
    float rand = random(250, 350);
    rect(i, rand, 20, 400 - rand);
    fill(20);
    rect(i + 5, rand - 5, 20 - 5, 400 - rand + 5);
  }
}

//Draws randomly generated stars
void drawStars(float x, float y, int lines, int c){
  float t = 0;
  for (int i = 0; i < lines; i++){
    stroke(c);
    line(x - 5, y + 5, x + 10*cos(t) - 5, y + 10*sin(t) + 5);
    t += 4*PI/lines;
    i++;
  }
  
  //add information to the arrays
  starx = append(starx, x);
  stary = append(stary, y);
  starlines = append(starlines, lines);
}
