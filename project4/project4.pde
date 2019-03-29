
PImage imgBack;
PImage imgObj[];
int countObj = 3;
int countObjects = 0;
int velocity = 5;
Alien[] ships = new Alien[countObj];

void setup() {
  size(1200, 750);
  imgBack=loadImage("test.jpg");
  imgObj= new PImage[countObj];
  for (int i=0; i<countObj; i++) {
    imgObj[i]=loadImage("img"+i+".png");
  }
  
  for(int i = 0; i < countObj; i++)
  {
    ships[i]= new Alien(random(0,width), 0);
  }
}
void draw() {


  image(imgBack, 0, 0, 1600, 1000);//background image
  
  //float countDelay= random(100, 400);
  //delay(int(countDelay));//convert int to float from rand func
  for( int i = 0; i <ships.length; i++)
{
  ships[i].run();
   
}
}

class Alien {
 
  float x=random(width);
  float y=0;
  float speedY=3;
  
 Alien(float posX, float posY){
  x=posX;
  y=posY;
  
}
  void run(){
    diplay();
    gravity();
    fall();
  }
  void gravity() {
    speedY+=0.3;
  }
  void fall() {
    y += speedY;
    if(y>= height)
    {
      y=0;
      x=random(width);
    }
  }
  void diplay() {
    image(imgObj[int(random(countObj))], x, y);
  }
}
