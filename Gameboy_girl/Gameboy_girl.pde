float xplr,yplr;
int guyhp, hpplr;
int state;
float speed = 0;
float gravity = .26;
boolean moveleft, moveright, jump;
int boxtop,boxbottom,boxright,boxleft;
int hl,sl;
float enemyx = 700,enemyy = 550; 
int direction = 2;
int 


void setup(){
  size(800,800); 
  boxbox();
}


void draw(){
  
  background(255);
  
  
  if (state == 0){
   startscreen();
   highlight();
    
  } 
  
  
  if (state == 1){
    
    movement();
    
    strokeWeight(2);
    fill(150,190,190);
    rectMode(CORNER);
    rect(0,550,1000,900);
    
    playersetup();
    enemystuff();
    enemymovement();
  } 
  
  
}
void playersetup(){
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

void boxbox(){
  boxleft=width/2-250;
  boxtop=height/3*2-125;
  boxbottom=height/3*2+125;
  boxright=width/2+250;
}



void mouseClicked(){
  if (mouseX>boxleft && mouseX<boxright && mouseY>boxtop && mouseY<boxbottom){
     state = 1; 
  }
}

void highlight(){
 if (mouseX>boxleft && mouseX<boxright && mouseY>boxtop && mouseY<boxbottom){
   hl = 255;
   sl = 0;
 }
 
 else{
  hl = 0;
  sl = 255;
 }
}


void startscreen(){
  fill(255,0,0);
  text("Box Jumper",width/2-220,height/3);
  
  strokeWeight(5);
  fill(hl);
  rectMode(CENTER);
  rect(width/2,height/3*2,500,250);
  fill(sl);
  textSize(80);
  text("Start game",width/2-200,height/3*2+20);
}

void enemystuff(){
  fill(255,20,0);
  rect(enemyx,enemyy,80,80);
  
  
  
}


void enemymovement(){
  
 if (enemyy == 200){
   direction = 1; 
 }
 if (enemyy == 500){
   direction = 2; 
 }
 
 if (direction == 2){
   enemyy -= 5;
 }
  if (direction == 1){
   enemyy += 5;
  }
}