/*
project: Assign 1
author: Wei-Yun, Kan
date: 2020.03.29
*/

PImage sky, ground, heart, hog, soldier, robot;
int soldierX, soldierY, soldierSpeed, robotX, robotY;
int laserGrowSpeed, laserSpeed, laserLeftX, laserLeftY, laserRightX,laserRightY;

void setup() {
	size(640, 480, P2D);
  sky = loadImage("img/bg.jpg");
  ground = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  hog = loadImage("img/groundhog.png");
  
  // show sky image
  image(sky,0,0);
  
  // grass
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  // 3 heart
  heart = loadImage("img/life.png");
  image(heart,10,10);
  image(heart,80,10);
  image(heart,150,10);
  
  // sun
  ellipseMode(CENTER);
  fill(255, 255, 0);
  ellipse(590,50,130,130);
  fill(253, 184, 19);
  ellipse(590,50,120,120);

  // show hog image
  image(hog,280,80);
  
  // decide soidier's y position & speed
  soldierY = floor(random(2,6)) * 80;
  soldierSpeed = 4;
  
  // decide robot's position
  robotY = floor(random(2,6)) * 80;
  robotX = floor(random(135,560));
  
  // set laser's position & speed
  laserLeftX = robotX + 25;
  laserLeftY = robotY + 32;
  laserRightX = robotX + 25;
  laserRightY = robotY + 42;
  laserSpeed = 2;
  laserGrowSpeed = 2;
}

void draw() {
  // show ground image
  image(ground,0,160);
 
  // show soldier
  image(soldier,soldierX,soldierY);
  soldierX += soldierSpeed;
  if(soldierX > 640){
    soldierX = -25;
  } // X position reset
  
  // show robot
  image(robot, robotX, robotY);
  
  // use 'rect' to grow laser
  fill(255,0,0);
  rectMode(CORNERS);
  rect(laserLeftX, laserLeftY, laserRightX, laserRightY,10,10,10,10);
  
  // grow laser's width to 40 pixels
  if(laserLeftX - laserRightX >= -40 ){
   laserLeftX -= laserGrowSpeed; 
  }
  
  // let laser move
  if(laserLeftX - laserRightX < -40){
  laserLeftX -= laserSpeed;
  laserRightX -= laserSpeed;
  }
  
  // reset laser
  if(laserLeftX < robotX - 160){
    laserLeftX = robotX + 25;
    laserRightX = robotX + 25;
  }
  
}
