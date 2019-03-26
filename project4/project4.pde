
PImage imgBack;
PImage imgObj[];
int countObj=6;
int countObjects=0;
int velocity=5;

void setup(){
  size(1200,750);
  imgBack=loadImage("test.jpg");
  imgObj= new PImage[countObj];
  for (int i=0; i<countObj; i++){
    imgObj[i]=loadImage("img"+i);
  }
}
void draw(){
  
  image(imgBack, 0, 0, 1200, 750);//background image 
  float countDelay= random(100, 400);
  delay(int(countDelay));//convert int to float from rand func
  int randomX= int(random(0, width));//randomize x position
  image(imgObj1,randomX,0); 
}

void positionObject(){
  int 
  
}
