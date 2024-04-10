//GLOBAL VARIABLES
int appWidth, appHeight;
//rect Variable declaration
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
//Panel variables
float panelOneX, panelOneY, panelOneWidth, panelOneHeight;
float panelTwoX, panelTwoY, panelTwoWidth, panelTwoHeight;
float panelThreeX, panelThreeY, panelThreeWidth, panelThreeHeight;

float topBarX, topBarY, topBarWidth, topBarHeight;
float albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight;
float songTextX, songTextY, songTextWidth, songTextHeight;

//image variable declaration
PImage demoAlbumCover;

//topBar buttons
PImage settingIcon, musicNoteIcon, downloadIcon;

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
  
  fill(0,25,45);
  rect(topBarX, topBarY, topBarWidth, topBarHeight);
  
  fill(255,0,0);
  rect(panelOneX, panelOneY, panelOneWidth, panelOneHeight);
  
  fill(0,255,0);
  rect(panelTwoX, panelTwoY, panelTwoWidth, panelTwoHeight);
  
  fill(0,0,255);
  rect(panelThreeX, panelThreeY, panelThreeWidth, panelThreeHeight);
  
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
  image(settingIcon, topBarWidth*0/15, topBarHeight*0, topBarHeight, topBarHeight);
  musicNoteIcon = loadImage("musicNoteIcon.png");
  image(musicNoteIcon, topBarWidth*1/15, topBarHeight*0, topBarHeight, topBarHeight);
  downloadIcon = loadImage("downloadIcon.png");
  image(downloadIcon, topBarWidth*2/15, topBarHeight*0, topBarHeight, topBarHeight);
  
  
  
} //END DRAW


void keyPressed() {
} //End keyPressed

void mousePressed() {
} //End mousePressed

// End MAIN Program
