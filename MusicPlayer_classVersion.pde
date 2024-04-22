//GLOBAL VARIABLES
int appWidth, appHeight;

//rect Variable declaration
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;

//topBar Variables
float topBarX, topBarY, topBarWidth, topBarHeight;

//topBarButton Variables
float topButtonY, topButtonWidth, topButtonHeight;
float musicButtonX, settingsButtonX, downloadButtonX, quitButtonX;
color quitButtonColor = color(255,255,255);

//Panel variables
float panelOneX, panelOneY, panelOneWidth, panelOneHeight;
float panelTwoX, panelTwoY, panelTwoWidth, panelTwoHeight;
float panelThreeX, panelThreeY, panelThreeWidth, panelThreeHeight;

//panelOneContent Variable
float albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight;
float songTextX, songTextY, songTextWidth, songTextHeight;

//image variable declaration
PImage demoAlbumCover;

//topBar buttons
PImage settingIcon, musicNoteIcon, downloadIcon, quitButtonIcon;

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
}

//SETUP
void setup() {
  //size(400, 500); //width, height
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  println(displayWidth, displayHeight);
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "No, fix your device"; 
  println(displayInstructions);
  
  //POPULATE RECTS
  
  //backgroundRect
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  
  //topBarRect
  topBarX = appWidth*0;
  topBarY = appHeight*0;
  topBarWidth = appWidth;
  topBarHeight = appHeight*1/10;
  
  //topBarButtonRects
  topButtonY = topBarHeight*0;
  topButtonWidth = topBarHeight;
  topButtonHeight = topBarHeight;
  settingsButtonX = topBarHeight*0;
  musicButtonX = topBarHeight*1;
  downloadButtonX = topBarHeight*2;
  quitButtonX  = topBarHeight*17;
  
  
  //panelOneRect
  panelOneX = appWidth*0;
  panelOneY = appHeight*1/10;
  panelOneWidth = appWidth*1/4;
  panelOneHeight = appHeight*9/10;
  
  //panelTwoRect
  panelTwoX = appWidth*1/4;
  panelTwoY = appHeight*1/10;
  panelTwoWidth = appWidth*2/4;
  panelTwoHeight = appHeight*9/10;
  
  //panelThreeRect
  panelThreeX = appWidth*3/4;
  panelThreeY = appHeight*1/10;
  panelThreeWidth = appWidth*1/4;
  panelThreeHeight = appHeight*9/10;
  
  //albumCoverRect
  albumCoverX  = panelTwoWidth*1/4 + panelOneWidth;
  albumCoverY =  panelTwoHeight*1/10 + topBarHeight;
  albumCoverWidth = panelTwoWidth*2/4;
  albumCoverHeight = panelTwoHeight*5/10;
  
  //songTextRect
  songTextX = panelTwoWidth*1/4 + panelOneWidth;
  songTextY = panelTwoHeight*6.5/10 + topBarHeight;
  songTextWidth = panelTwoWidth*1/2;
  songTextHeight = panelTwoHeight*1/10;
  
  
  //RENDER RECTS
  //rect(X, Y, Width, Height)
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  
  //topBarRect
  fill(255,255,255);
  rect(topBarX, topBarY, topBarWidth, topBarHeight);
  println(topBarWidth, topBarHeight);
  
  //topBarButtonRect
  //Uncomment to see real position of bar buttons
  //fill(255,0,0);
  //rect(settingsButtonX, topButtonY, topButtonWidth, topButtonHeight);
  //fill(0,255,0);
  //rect(musicButtonX, topButtonY, topButtonWidth, topButtonHeight);
  //fill(0,0,255);
  //rect(downloadButtonX, topButtonY, topButtonWidth, topButtonHeight);
  //fill(quitButtonColor);
  //rect(quitButtonX, topButtonY, topButtonWidth, topButtonHeight);
  
 
  
  //panelRects
  fill(255,0,0);
  rect(panelOneX, panelOneY, panelOneWidth, panelOneHeight);
  
  fill(0,255,0);
  rect(panelTwoX, panelTwoY, panelTwoWidth, panelTwoHeight);
  
  fill(0,0,255);
  rect(panelThreeX, panelThreeY, panelThreeWidth, panelThreeHeight);
  
  //albumCoverRect
  strokeWeight(16);
  stroke(50,50,50);
  rect(albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight);
  
  strokeWeight(2);
  stroke(0,0,0);
  
  //Uncomment if you need to see the space that the song info takes up
  //fill(255,255,255);
  //rect(songTextX, songTextY, songTextWidth, songTextHeight);
  
  String songName = "Song Name";
  int songNameSize = 24;
  String songArtist = "Artist Name";
  int songArtistSize = 18;
  String songDuration = "00:00";
  int songDurationSize = 12;
  fill(0,0,0);
  textSize(songNameSize);
  text(songName, songTextX, songTextY + songNameSize);
  
  textSize(songDurationSize);
  text(songDuration, songTextX + textWidth(songName)*2.1, songTextY + songNameSize);
  println(textWidth(songName));
  
  textSize(songArtistSize);
  text(songArtist, songTextX, songTextY + songNameSize + songArtistSize);
  
  
  
  /* unused rects
  rect(panelX, panelY, panelWidth, panelHeight);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  */
} //END SETUP





//DRAW
void draw() {
  demoAlbumCover = loadImage("demoAlbumCover.jpg");
  image(demoAlbumCover, albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight );
  
  settingIcon = loadImage("settingsIcon.png");
  image(settingIcon, settingsButtonX, topBarHeight*0, topBarHeight, topBarHeight);
  musicNoteIcon = loadImage("musicNoteIcon.png");
  image(musicNoteIcon, musicButtonX + topBarWidth*1/100, topButtonY, topButtonWidth, topButtonHeight);
  downloadIcon = loadImage("downloadIcon.png");
  image(downloadIcon, downloadButtonX + topBarWidth*3/100, topButtonY, topButtonWidth, topButtonHeight);
  quitButtonIcon = loadImage("quitButtonIcon.png");
  //image(quitButtonIcon, quitButtonX, topButtonY, topButtonWidth, topButtonHeight);
  
  
  //Checks if mouse is inside quit button
  println(quitButtonX, topButtonY, topButtonWidth, topButtonHeight);
  if(mouseX >= quitButtonX && mouseY >= topButtonY && mouseX <= topButtonWidth + quitButtonX && mouseY <= topButtonHeight + topButtonY ) {
    quitButtonColor = color(255,0,0);
  }
  else{quitButtonColor = color(255,255,255);}
  fill(quitButtonColor);
  rect(quitButtonX, topButtonY, topButtonWidth, topButtonHeight);
  
    
 
  
} //END DRAW


void keyPressed() {
} //End keyPressed

void mousePressed() {
 
} //End mousePressed

// End MAIN Program
