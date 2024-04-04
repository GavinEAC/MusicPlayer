//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
//
//Populate
backgroundX = appWidth;
backgroundY = appHeight;
backgroundWidth = appWidth; 
backgroundHeight = appHeight;

 
void setup() {
  //Display: CANVAS and FULLSCREEN
  //size(600, 600); //Width, Height
  fullScreen();// displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  //landscape is HARDCODED
  String displayInstructions = (appWidth >= appHeight) ? "Good to go" : "Not Good" ;
  println(displayInstructions);
  //
  //Layout divs
  //rect(X, Y, Width, Height);
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);

} 
//End setup

void draw() {
  
}
//End Draw

void keyPressed() {
  
}
//End keyPressed

void mousePressed() {
  
} 
//End mousePressed

// End MAIN Program
