//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Creative Programming for Digital Media & Mobile Apps
//Assigment_01
//Autor: Jutair Rios
//SonicPainter-Implementation


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.05;
float a1=2;
float a2=02;


void setup()
{
  size(640, 960);
  maxim = new Maxim(this);
  player = maxim.loadFile("106857__vcfofficial__electro-loop-132-bpm.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("1140__walkerbelm__shirtsy-distort.wav");
  player2.setLooping(false);
  player.volume(0.25);
  background(0);
  rectMode(CENTER);

}

void draw()
{
/*Chaging the background*/
smooth();
noStroke();


for (int y=0; y <= height; y+=40){
  
  for(int x=0; x <=width; x +=40){
    
    fill(0,140);
    ellipse(x,y,40,40);
    
}

}
delay(100);
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;
ellipse( x, y, a1, a2);
a2+=5;
a1+=5;
if(a1>30){
  
  a1-=8;
  if(a2>30){
  a2-=8;
}
}

angle += speed;
scalar += speed;

}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);

  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
//  rect(mouseX, mouseY, speed, speed);
  ellipse(mouseX, mouseY, speed, speed);
 line(pmouseX, pmouseY,mouseX, mouseY);
 // brush1(mouseX, mouseY,speed, speed,lineWidth);
 brush2(mouseX, mouseY,speed, speed,lineWidth);
 // brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

// brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
 //brush6(mouseX, mouseY,speed, speed,lineWidth);
// brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);

  player.setFilter((float) mouseY/height*5000,mouseX / width);
  player2.setFilter((float) mouseY/height*5000,mouseX / width);
  
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  //println("rel");
  player2.ramp(0.,1000);

        
}
