
PImage imgBack;
PImage imgObj[];
int countObj = 4;//num of images-aliens
int velocity = 10;
Alien[] ships = new Alien[countObj];//creating objects from constuctor

void setup() {
  size(1200, 750);
  imgBack=loadImage("test.jpg");//backgound
  imgObj= new PImage[countObj];//array of alien-just images
  //loading images
  for (int i=0; i<countObj; i++) {
    imgObj[i]=loadImage("img"+i+".png");
  }

  for (int i = 0; i < countObj; i++)
  {
    //float countDelay= random(100, 400);
    //delay(int(countDelay));//convert int to float from rand func //i need to figure out where i put it
    ships[i]= new Alien(random(0, width), 0);//sending to the class position of the constructor
  }
}
void draw() {
  image(imgBack, 0, 0, 1600, 1000);//background image
  for ( int i = 0; i <ships.length; i++)
  {
    ships[i].run();
  }
}

class Alien {
  //every img has its own class with variables
  float x=random(width);
  float y=0;
  float speedY=velocity;
  //constuctor fox xand y
  Alien(float posX, float posY) {
    x=posX;
    y=posY;
  }
  //run all the functions at once (everything aptates together)
  void run() {
    diplay();
    gravity();
    fall();
  }
  void gravity() {
    speedY+=0.03;//increases velocity ass the time passes
  }
  void fall() {
    y += speedY;
    if (y>= height)
    {
      y=0;
      x=random(100, width-100);//limited space to play-easier for a user
    }
  }
  void diplay() {
    image(imgObj[int(random(countObj))], x, y);
  }
}
