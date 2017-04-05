color warm1 = color(#971B08);
color warm2 = color(#975008);
color warm3 = color(#EB2102);
color warm4 = color(#EB7702);
color cool1 = color(#084B5E);
color cool2 = color(#066F26);
color cool3 = color(#067392);
color cool4 = color(#01AD35);
float scalevalue = .5;

size(400, 400);
background(#3E0800);
translate(200, 200);
strokeWeight(5);

//Background Mountain
fill(cool1);
beginShape();
  vertex(-200, 200);
  vertex(-200, 100);
  vertex(-140, -120);
  vertex(-50, -60);
  vertex(0, 50);
  vertex(50, 0);
  vertex(200, 100);
  vertex(200, 200);
endShape();

//Foreground Mountain
pushMatrix();
  scale(1, scalevalue);
  translate(0, 200);
  fill(cool3);
  beginShape();
    vertex(-200, 200);
    vertex(-200, 100);
    vertex(-140, -120);
    vertex(-50, -60);
    vertex(0, 50);
    vertex(50, 0);
    vertex(200, 100);
    vertex(200, 200);
  endShape();
popMatrix();

//Background Sun
fill(cool2);
ellipse(100, -100, 200, 200);

//Foreground Moon
fill(cool4);
ellipse(50, -50, 100, 100);

//Grid
/*stroke(255);
strokeWeight(2);
for (int i = -200; i <= 200; i = i + 10){
  for (int j = -200; j <= 200; j = j + 10){
    point(i, j);
    if (i == 0 || j == 0){
      stroke(0);
      point(i, j);
      stroke(255);
    }
  }
}
*/
