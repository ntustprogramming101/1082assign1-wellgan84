PImage sky, ground, heart, hog, soldier, robot;
int soldierX, soldierY, robotX, robotY;
int laserGrowSpeed, laserSpeed, laserLeftX, laserLeftY, laserRightX,laserRightY;

void setup() {
	size(640, 480, P2D);
  sky = loadImage("img/bg.jpg");
  ground = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  hog = loadImage("img/groundhog.png");
  
  image(sky,0,0);
  
  // grass
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  // heart
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

  image(hog,280,80);

  soldierY = floor(random(2,5)) * 80;
  robotY = floor(random(2,5)) * 80;
  robotX = floor(random(135,560));
  
  laserLeftX = robotX + 25;
  laserLeftY = robotY + 37;
  laserRightX = robotX + 25;
  laserRightY = robotY + 47;
  laserSpeed = 2;
  laserGrowSpeed = 2;
}

void draw() {
  image(ground,0,160);
 
  image(soldier,soldierX,soldierY);
  soldierX += 2;
  if(soldierX > 640){
    soldierX = -25;
  }
  
  image(robot, robotX, robotY);
  fill(255,0,0);
  
  rectMode(CORNERS);
  rect(laserLeftX, laserLeftY, laserRightX, laserRightY,10,10,10,10);
  laserLeftX -= laserSpeed;
  laserRightX -= laserSpeed;
  
  if(laserLeftX >= robotX - 65 ){
   laserLeftX -= laserGrowSpeed; 
  }
  
  if(laserLeftX < robotX - 185){
    laserLeftX = robotX + 25;
    laserRightX = robotX + 25;
  }
  
}
