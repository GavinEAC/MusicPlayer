//GLOBAL VARIABLES
int appWidth, appHeight;

//image variable declaration
PImage demoAlbumCover;
PImage settingIcon, musicNoteIcon, downloadIcon, quitButtonIcon;

//
//
//
//CLASS BEGINS
//
//
//
//Rect Class for convenience and fun
class parentRect{
  int rectX = 0;
  int rectY = 0;
  int rectWidth = displayWidth;
  int rectHeight = displayHeight;

  parentRect(){
    noFill();
    noStroke();
    rect(rectX, rectY, rectWidth, rectHeight);
  }
    
}

class Rect{
  float rectX;
  float rectY;
  float rectWidth;
  float rectHeight;
  color rectColor;
  Rect rectParent;
  parentRect rectMainParent;
  
  //CONSTRUCTOR FOR GRANDCHILDREN OF MAIN RECT AND ON
  Rect(Rect parent, String x, String y, String Width, String Height){
    //establishes parent rect
    rectParent = parent;
    
    
    //Mananges x,y,height,width
    if( x.contains("%") == true) {
      float percentValue = Integer.parseInt(x.substring(1));
      percentValue = percentValue/100;
      rectX = (percentValue * parent.rectWidth) + parent.rectX;
    }
    else if( x.contains("f") == true){
      String stringFractionValue = x.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectX = (floatFractionValue * parent.rectWidth) + parent.rectX;
    }
    else{
      rectX = (Integer.parseInt(x) * parent.rectWidth) + parent.rectX;
    }
    
    if( y.contains("%") == true) {
      float percentValue = Integer.parseInt(y.substring(1));
      percentValue = percentValue/100;
      rectY = (percentValue * parent.rectHeight) + parent.rectY;
    }
    else if( y.contains("f") == true){
      String stringFractionValue = y.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectY= (floatFractionValue * parent.rectHeight) + parent.rectY;
    }
    else{
      rectY = (Integer.parseInt(y) * parent.rectHeight) + parent.rectY;
    }
   
    if( Width.contains("%") == true) {
      float percentValue = Integer.parseInt(Width.substring(1));
      percentValue = percentValue/100;
      rectWidth = percentValue * parent.rectWidth;
    }
    else if( Width.contains("f") == true){
      String stringFractionValue = Width.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectWidth = floatFractionValue * parent.rectWidth;
    }
    else{
      rectWidth = Integer.parseInt(Width);
    }
    
    if( Height.contains("%") == true) {
      float percentValue = Integer.parseInt(Height.substring(1));
      percentValue = percentValue/100;
      rectHeight = percentValue * parent.rectHeight;
    }
    else if( Height.contains("f") == true){
      String stringFractionValue = Height.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectHeight= floatFractionValue * parent.rectHeight;
    }
    else{
      rectHeight = Integer.parseInt(Height);
    }
    
    //defaulted settings of a rect object
    rectColor = color(255,255,255);
    
  }
  //
  //
  //
  //CONSTRUCTOR FOR RECTS THAT BELONG TO MAIN RECT
  //
  //
  //
  Rect(parentRect parent, String x, String y, String Width, String Height){
    
    rectMainParent = parent;
    
    if( x.contains("%") == true) {
      float percentValue = Integer.parseInt(x.substring(1));
      percentValue = percentValue/100;
      rectX = percentValue * parent.rectWidth;
    }
    else if( x.contains("f") == true){
      String stringFractionValue = x.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectX = floatFractionValue * parent.rectWidth;
    }
    else{
      rectX = Integer.parseInt(x);
    }
    
    if( y.contains("%") == true) {
      float percentValue = Integer.parseInt(y.substring(1));
      percentValue = percentValue/100;
      rectY = percentValue * parent.rectHeight;
    }
    else if( y.contains("f") == true){
      String stringFractionValue = y.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectY= floatFractionValue * parent.rectHeight;
    }
    else{
      rectY = Integer.parseInt(y);
    }
   
    if( Width.contains("%") == true) {
      float percentValue = Integer.parseInt(Width.substring(1));
      percentValue = percentValue/100;
      rectWidth = percentValue * parent.rectWidth;
    }
    else if( Width.contains("f") == true){
      String stringFractionValue = Width.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      println(floatFractionValue);
      rectWidth = floatFractionValue * parent.rectWidth;
    }
    else{
      rectWidth = Integer.parseInt(Width);
    }
    
    if( Height.contains("%") == true) {
      float percentValue = Integer.parseInt(Height.substring(1));
      percentValue = percentValue/100;
      rectHeight = percentValue * parent.rectHeight;
    }
    else if( Height.contains("f") == true){
      String stringFractionValue = Height.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectHeight = floatFractionValue * parent.rectHeight;
    }
    else{
      rectHeight = Integer.parseInt(Height);
    }
    
    //defaulted settings of a rect object
    rectColor = color(255,255,255);
    
  }
  
  //draws rect starting from center. x,y is postiioned in center of rect
  void centralDrawMode(){
    rectX = rectX - (rectWidth/2);
    rectY = rectY - (rectHeight/2);
  }
    
  void printArgs(){
    println(rectX, rectY, rectWidth, rectHeight);
  }
  
  void drawRect(){
    fill(rectColor);
    rect(rectX, rectY, rectWidth, rectHeight);
  }
  
  void drawImage(String imageAdress){
    PImage image = loadImage(imageAdress);
    image(image, rectX, rectY, rectWidth, rectHeight);
  }
}

//
//
//
//SETUP
//
//
//
void setup() {
  //size(400, 500); //width, height (non fullscreen is not supported in this version
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  println(displayWidth, displayHeight);
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "No, fix your device"; 
  println(displayInstructions);
  
  //Instantiate master background rect
  parentRect backgroundRect = new parentRect();
  
  Rect topBarRect = new Rect(backgroundRect, "0", "0", "%100", "%10");
  topBarRect.rectColor = color(255,255,255);
  topBarRect.drawRect();
  
  //Top Bar Button Rects
  Rect settingsButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  settingsButtonRect.rectWidth = settingsButtonRect.rectHeight;
  //settingsButtonRect.drawRect();
  settingsButtonRect.drawImage("settingsIcon.png");
  
  Rect musicButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  musicButtonRect.rectColor = color(25,255,0);
  musicButtonRect.rectX = musicButtonRect.rectParent.rectHeight;
  musicButtonRect.rectWidth = musicButtonRect.rectHeight;
  //musicButtonRect.drawRect();
  musicButtonRect.drawImage("musicNoteIcon.png");
  
  Rect downloadButtonRect = new Rect(topBarRect, "%10", "0", "0", "%100");
  downloadButtonRect.rectX = downloadButtonRect.rectParent.rectHeight * 2 + 5;
  downloadButtonRect.rectWidth = downloadButtonRect.rectHeight;
  //uploadButtonRect.drawRect();
  downloadButtonRect.drawImage("downloadIcon.png");
  
  Rect quitButtonRect = new Rect(topBarRect, "%95", "0", "0", "%100");
  quitButtonRect.rectX = quitButtonRect.rectParent.rectWidth - quitButtonRect.rectParent.rectHeight;
  quitButtonRect.rectWidth = quitButtonRect.rectHeight;
  //quitButtonRect.drawRect();
  quitButtonRect.drawImage("quitButtonIcon.png");
  
  
  Rect panelOne = new Rect(backgroundRect, "0", "%10", "f1/4", "%90");
  panelOne.rectColor = color(255,0,0);
  panelOne.drawRect();
  
  Rect panelTwo = new Rect(backgroundRect, "f1/4", "%10", "f1/2", "%90");
  panelTwo.rectColor = color(0,255,0);
  panelTwo.drawRect();
  
  Rect panelThree = new Rect(backgroundRect, "f3/4", "%10", "f1/4", "%90");
  panelThree.rectColor = color(0,0,255);
  panelThree.drawRect();
  
  Rect albumCoverRect = new Rect(panelTwo, "%25", "%20", "%50", "%50");
  //albumCoverRect.drawRect();
  albumCoverRect.drawImage("demoAlbumCover.jpg");
  
  Rect songTextRect = new Rect(panelTwo, "%25", "%69", "%50", "%10");
  songTextRect.drawRect();
  
  
  String songName = "Song Name";
  int songNameSize = 24;
  String songArtist = "Artist Name";
  int songArtistSize = 18;
  String songDuration = "00:00";
  int songDurationSize = 12;
  fill(0,0,0);
  textSize(songNameSize);
  text(songName, songTextRect.rectX, songTextRect.rectY + songNameSize);
  
  textSize(songDurationSize);
  text(songDuration, songTextRect.rectX + textWidth(songName)*2.1, songTextRect.rectY + songNameSize);
  println(textWidth(songName));
  
  textSize(songArtistSize);
  text(songArtist, songTextRect.rectX, songTextRect.rectY + songNameSize + songArtistSize);
} //END SETUP




//
//
//
//DRAW
//
//
//
void draw() {
  /*
  demoAlbumCover = loadImage("demoAlbumCover.jpg");
  image(demoAlbumCover, albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight );
  
 
  
  
 
 
  if(mouseX >= quitButtonX && mouseY >= topButtonY && mouseX <= topButtonWidth + quitButtonX && mouseY <= topButtonHeight + topButtonY ) {
   
  
    
 */
  
} //END DRAW


void keyPressed() {
} //End keyPressed

void mousePressed() {
 
} //End mousePressed

// End MAIN Program
