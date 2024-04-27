import ddf.minim.*;
Minim minim;
AudioPlayer song;

//GLOBAL VARIABLES
int appWidth, appHeight;



//image variable declaration
PFont assets;
PImage demoAlbumCover;
PImage settingIcon, musicNoteIcon, downloadIcon, quitButtonIcon;
parentRect backgroundRect;
Rect topBarRect;
Rect settingsButtonRect;
Rect musicButtonRect;
Rect uploadButtonRect;
Rect quitButtonRect;
Rect panelOne;
Rect panelTwo;
Rect panelThree;
Rect albumCoverRect;
Rect songTextRect;






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
  backgroundRect = new parentRect();
  topBarRect = new Rect(backgroundRect, "0", "0", "%100", "%10");
  
  settingsButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  settingsButtonRect.rectWidth = settingsButtonRect.rectHeight;
  
  musicButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  musicButtonRect.rectX = musicButtonRect.rectParent.rectHeight * 1;
  musicButtonRect.rectWidth = musicButtonRect.rectHeight;
  musicButtonRect.rectColor = color(0,255,0);
  
  uploadButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  uploadButtonRect.rectX = uploadButtonRect.rectHeight * 2;
  uploadButtonRect.rectWidth = uploadButtonRect.rectHeight;
  uploadButtonRect.rectColor = color(0,0,255);
  
  quitButtonRect = new Rect(topBarRect, "0", "0", "0", "%100");
  quitButtonRect.rectX = quitButtonRect.rectParent.rectWidth - quitButtonRect.rectParent.rectHeight;
  quitButtonRect.rectWidth = quitButtonRect.rectHeight;
  
  
  
  
  panelOne = new Rect(backgroundRect, "0", "%10", "f1/4", "%90");
  
  panelTwo = new Rect(backgroundRect, "f1/4", "%10", "f1/2", "%90");
  
  panelThree = new Rect(backgroundRect, "f3/4", "%10", "f1/4", "%90");
  
  albumCoverRect = new Rect(panelTwo, "%25", "%20", "%50", "%50");
  
  songTextRect = new Rect(panelTwo, "%25", "f697/1000", "%50", "%10");

  //Instantiate Rects
  
  topBarRect.rectColor = color(255,255,255);
  panelOne.rectColor = color(255,0,0);
  panelTwo.rectColor = color(0,255,0);
  panelThree.rectColor = color(0,0,255);
  albumCoverRect.rectColor = color(255,255,255);
  songTextRect.rectColor = color(255,255,255);
  
  topBarRect.drawRect();
  quitButtonRect.drawRect();
  panelOne.drawRect();
  panelTwo.drawRect();
  panelThree.drawRect();
  albumCoverRect.drawImage("demoAlbumCover.jpg");
  songTextRect.drawRect();
  settingsButtonRect.drawRect();
  musicButtonRect.drawRect();
  uploadButtonRect.drawRect();
  
  
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
  
  textSize(songArtistSize);
  text(songArtist, songTextRect.rectX, songTextRect.rectY + songNameSize + songArtistSize);
  
  assets = loadFont("SegoeMDL2Assets-48.vlw");
 
  /*
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.play();
  */
  
} //END SETUP





//DRAW
void draw() {
  
  if(quitButtonRect.isHovering() == true){
    quitButtonRect.rectColor = color(255,0,0);
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2);
  }
  else{
    quitButtonRect.rectColor = color(255,255,255);
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2);
  }
  
  if(settingsButtonRect.isHovering() == true){
    settingsButtonRect.rectColor = color(255,0,0);
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2);
  }
  else{
    settingsButtonRect.rectColor = color(255,255,255);
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2);
  }
  
  if(musicButtonRect.isHovering() == true){
    musicButtonRect.rectColor = color(255,0,0);
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2);
  }
  else{
    musicButtonRect.rectColor = color(255,255,255);
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2);
  }
  
  if(uploadButtonRect.isHovering() == true){
    uploadButtonRect.rectColor = color(255,0,0);
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2);
  }
  else{
     uploadButtonRect.rectColor = color(255,255,255);
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2);
  }
  
  
} //END DRAW


void keyPressed() {
} //End keyPressed

void mousePressed() {
  //println("mouse clicked");
  if(quitButtonRect.isHovering() == true){
    println("quit button has been clicked");
    System.exit(0);
  }
} //End mousePressed

// End MAIN Program
