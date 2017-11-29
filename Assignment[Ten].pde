float angle, camSpeed, 
  x, y, z, 
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, 
  orthoScale, 
  viewDist, 
  extents = 250;
boolean orthographic;

float ambv1, ambv2, ambv3, ambx1, amby1, ambz1, 
  ambx2, amby2, ambz2;

float dirv1, dirv2, dirv3, dirx1, diry1, dirz1, 
  dirx2, diry2, dirz2;

int rate, colorMode;

//setup// //lights//
void setup(){
  surface.setResizable(true);
  surface.setTitle("Lighting");
  pixelDensity(displayDensity());
  size(640, 420, P3D);
 ellipse(50,50,50,50);
 background(64);
 noStroke();
 
  ambv1 = random(0, 156);
  ambv2 = random(0, 156);
  ambv3 = random(0, 156);
  ambx1 = random(0, width);
  amby1 = random(0, height);
  ambz1 = 0;
  
  rate = 100;
  colorMode = RGB;
   dirv1 = random(0, 80);
  dirv2 = random(0, 80);
  dirv3 = random(0, 80);
  dirx1 = random(-1, 1);
  diry1 = random(-1, 1);
  dirz1 = random(-1, 1);

  rate = 100;
  colorMode = RGB;
 //camera//
  surface.setResizable(true);
  surface.setTitle("Camera");
 
 angle = 0;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  orthoScale = 2.0;
  orthographic = false;

}


  


//draw//
void draw(){
 colorMode(colorMode, 255, 255, 255);
  background(32);

  ambientLight(ambv1, ambv2, ambv3, ambx1, amby1, ambz1);
  directionalLight(dirv1, dirv2, dirv3, dirx1, diry1, dirz1);

//sphere//
  pushMatrix();
  translate(width * 0.125, height / 2.0, -height / 1.25);
  rotateX(frameCount / 90.0);
  rotateY(frameCount / 90.0);
  sphere(height / 2.5);
  popMatrix();

//box//
 pushMatrix();
  translate(width * 0.825, height / 2.0, -height / 1.25);
  rotateX(frameCount / 90.0);
  rotateY(frameCount / 90.0);
  box(height / 2.5);
  popMatrix();

//frame count//
if (frameCount % rate == 0){
    ambx2 = random(0, width);
    amby2 = random(0, height);
    ambz2 = random(-5.0, 5.0);
}

ambx1 = lerp(ambx1, ambx2, 0.05);
  amby1 = lerp(amby1, amby2, 0.05);
  ambz1 = lerp(ambz1, ambz2, 0.05);
}


void mousePressed() {
  ambv1 = random(0, 156);
  ambv2 = random(0, 156);
  ambv3 = random(0, 156);
  println("\nambient: #" + hex(color(ambv1, ambv2, ambv3)).substring(2));
}

  

//end//
