float xplr,yplr;
int guyhp, hpplr;
int state;
float speed = 0;
float gravity = .26;
boolean moveleft, moveright, jump;



void setup(){
 size(800,800); 
}


void draw(){
  
  background(255);
  
  
  if (state == 0){
   fill(0);
   rectMode(CENTER);
   rect(width/2,height/2,250,250);
    
  } 
  
  
  if (state == 1){
    
    movement();
    
    fill(150,190,190);
    rectMode(CORNER);
    rect(0,550,1000,900);
  
   //player's box
    fill(0, 150, 255);
    rectMode(CENTER);
    rect(xplr, yplr, 40, 40);
  
  
    //applying velocity and then acceleration to the square
    yplr = yplr + speed;
    speed = speed + gravity;
  
    //making the square bounce off the ground less per bounce
    //by multiplying my a negavive decimal
  
    if (yplr > height/3*2) {
      speed = speed * 0 ;
      yplr = height/3*2;
    }
    if (xplr > 750){
   xplr = 750; 
  }
  
  if (xplr < 50){
   xplr = 50; 
  }
    
  } 
  
  
}





// setting up the movement of the player
void movement() {
  if (jump) {
    if (yplr >= 250 ) {
      yplr -= 12;
    }
  }
  if (moveleft){
    xplr -= 15;
    }
  
  if (moveright){
    xplr += 15;
     
   }
      }
    



// setting up key input for the player to move
void keyPressed() {
  if (key == 'w'|| key == 'W') {
    jump = true;
  }
  
  if (key == 'a'|| key == 'A') {
    moveleft = true;
  }
  
  if (key == 'd'|| key == 'D') {
    moveright = true;
  }
  if (key == 'r' || key == 'R'){
    state = 1;  
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    jump = false;
  }
  
  if (key == 'a' || key == 'A') {
    moveleft = false;
  }
  
  if (key == 'd' || key == 'D') {
    moveright = false;
   
   if (key == 'r' || key == 'R'){
    state = 1;  
  }
  }
}