PVector loc, vel, acc;
int sz = 70;

void setup() {
  size(800, 600);
   loc = new PVector(width/2, height/2);
  vel = PVector.random2D();    //random unit vector
  acc = new PVector(0, 0);
 
}

void draw() {
  background(0);
  //move the ball
  vel.add(acc);
  loc.add(vel);

  //check to see if the mouse is inside the circle
  if (dist(mouseX, mouseY, loc.x, loc.y) < sz/2) {  
    fill(255, 0, 0);                                
  } else {                                          
    fill(0, 200, 55);                           
  }

 // draw ball
  ellipse(loc.x, loc.y, sz, sz);

  //bounce ball
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }

  //draw a small rectange to indicate mouse location
  rect(mouseX, mouseY, 10, 10);
}
