//GLOBAL VARIABLES
int appWidth, appHeight;

//image variable declaration
PImage demoAlbumCover;
PImage settingIcon, musicNoteIcon, downloadIcon, quitButtonIcon;


//SETUP
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
  
  //Instantiate Rects
  Rect topBarRect = new Rect(backgroundRect, "0", "0", "%100", "%10");
  topBarRect.rectColor = color(255,255,255);
  
  Rect panelOne = new Rect(backgroundRect, "0", "%10", "f1/4", "%90");
  panelOne.rectColor = color(255,0,0);
  
  Rect panelTwo = new Rect(backgroundRect, "f1/4", "%10", "f1/2", "%90");
  panelTwo.rectColor = color(0,255,0);
  
  Rect panelThree = new Rect(backgroundRect, "f3/4", "%10", "f1/4", "%90");
  panelThree.rectColor = color(0,0,255);
  
  Rect albumCoverRect = new Rect(panelTwo, "%25", "%20", "%50", "%50");
  albumCoverRect.rectColor = color(255,255,255);
   
  Rect songTextRect = new Rect(panelTwo, "%25", "%69", "%50", "%10");
  songTextRect.rectColor = color(255,255,255);
  
  topBarRect.drawRect();
  panelOne.drawRect();
  panelTwo.drawRect();
  panelThree.drawRect();
  albumCoverRect.drawRect();
  songTextRect.drawRect();
  topBarRect.rectColor = color(255,255,255);
  panelOne.rectColor = color(255,0,0);
  panelTwo.rectColor = color(0,255,0);
  panelThree.rectColor = color(0,0,255);
  
  
  
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





//DRAW

//
//
void draw() {
  //quitButtonRect.isClicked();
  
} //END DRAW


void keyPressed() {
} //End keyPressed

void mousePressed() {
 
} //End mousePressed

// End MAIN Program
