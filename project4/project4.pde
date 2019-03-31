
PImage imgBack;
PImage imgObj[];
int countObj = 4;//num of images-aliens
int velocity = 10;
int num;
int count=0;

float timeSinceLastSpawn = -90000;
float spawnInterval = 2000f;

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
    ships[i]= new Alien(random(100, width-100), 0);//sending to the class position of the constructor
  }
}
void draw() {
  image(imgBack, 0, 0, 1600, 1000);//background image
  for ( int i=0; i<=count; i++)
  {
    ships[i].run();
  }

  if (timeSinceLastSpawn + spawnInterval < millis()) {
    timeSinceLastSpawn = millis();

    for ( int i=0; i<=count; i++)
    {
      if (ships[i].getActive() == false) {
        ships[i].setActive(true);
        break;
      }
    }
  }
}


class Alien {
  //every img has its own class with variables
  int cooseImage=int(random(countObj));
  float x=random(200,width-200);
  float y=0;
  float speedY=velocity;

  private boolean active = false;

  //constuctor fox xand y
  Alien(float posX, float posY) {
    x=posX;
    y=posY;
  }
  //run all the functions at once (everything aptates together)
  void run() {
    if (active) {
      diplay();
      gravity();
      fall();
    }
  }
  void gravity() {
    speedY+=0.03;//increases velocity ass the time passes

    if (speedY > 10)
      speedY = 10;
  }
  void fall() {
    y += speedY;
    if (y>= height+100)
    {
      y=0;
      x=random(100, width-100);//limited space to play-easier for a user
    }
  }
  void diplay() {
    image(imgObj[cooseImage], x, y);
  }

  public boolean getActive() {
    return active;
  }

  public void setActive(boolean newValue) {
    active = newValue;
  }
}
