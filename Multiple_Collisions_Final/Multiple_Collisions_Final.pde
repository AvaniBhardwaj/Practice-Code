int count = 300;
//declare loc, vel, and acc arrays
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];

void setup() {
  size(displayWidth, displayHeight);
  for (int i = 0; i < count; i++) {    //access each index in the arrays...
    sz[i] = random(20, 80);           //initialize the values in sz[] array
    loc[i] = new PVector(random(sz[i], width-sz[i]), random(sz[i], height-sz[i]));  //initialize values for location array
    vel[i] = PVector.random2D();       //initialize values in velocity array
    acc[i] = new PVector(0, 0);        //initialize values in acceleration array
  }
}

void draw() {
  background(255,255,255);

  for (int i = 0; i < count; i++) {    //access each index in the arrays...
    //move the ball
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);

    //check to see if the circles are touching
    for (int j = 0; j < count; j++) {
      if (i!=j) {
        if (loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) { //...if it is...
          print("THERE IS A COLLISION");
          if (loc[i].x < loc[j].x) {    //if ball 1 is to the left of ball 2...
            vel[i].x = -abs(vel[i].x);
            vel[j].x = abs(vel[j].x);
          } else {
            vel[i].x = abs(vel[i].x);
            vel[j].x = -abs(vel[j].x);
          }
          if (loc[i].y < loc[j].y) {    //if ball 1 is to the left of ball 2...
            vel[i].y = -abs(vel[i].y);
            vel[j].y = abs(vel[j].y);
          } else {
            vel[i].y = abs(vel[i].y);
            vel[j].y = -abs(vel[j].y);
          }
        }
      }
    }

    //draw the ball
    fill(random(255),random(255),random(255)); 
    rect(loc[i].x, loc[i].y, sz[i], sz[i]);
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

    //bounce the ball
    if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
      vel[i].x *= -1;
    }
    if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
      vel[i].y *= -1;
    }
  }
}

void mouseReleased() {
  loc[0].set(mouseX, mouseY);
}
