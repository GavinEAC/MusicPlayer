import ddf.minim.*;
import java.lang.reflect.Array;  
import java.util.Arrays;  
import java.io.*;

//GLOBAL VARIABLES
int appWidth, appHeight;
boolean isPaused;
int selectedPanelUse;



//image and font declaration
PFont assets;
PFont defaultFont;
PImage demoAlbumCover;

//Minim Initialization and song management variables
Minim minim;
AudioPlayer song;
String[] songList;
int currentSong;
Rect[] songSelectionRectArray;
int songLevel = 0;


//SETUP
void setup() {
  setTheme(pinkTheme);
  fullScreen(); 
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "No, fix your device"; 
  println(displayInstructions);
  
  //Load fonts
  assets = loadFont("SegoeMDL2Assets-48.vlw");
  defaultFont = createFont("OpenSans-Bold.ttf", 48, true);
  
  //draws out initial screen state
  createDivs();
  setDivColors();
  drawDivs();
  albumCoverRect.drawImage("demoAlbumCover.jpg");
  createButtons();
  //Buttons are drawn in draw Function, so its not needed here
  
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
  
  //Loads Songs from music folder and adds them to an array
  String path = sketchPath("data/music");
  File musicDir = new File(path);
  String[] listOfFiles = musicDir.list();
  for(int i = 0; i < listOfFiles.length; i++){
    listOfFiles[i] = "music/" + listOfFiles[i];
  }
  
  //instantiates minim stuff
  minim = new Minim(this);
  songList = listOfFiles;
  currentSong = 0;
  song = minim.loadFile(songList[currentSong]);
  
  songSelectionRectArray = new Rect[songList.length];
  
  for(int i = 0; i < listOfFiles.length; i++){
    songSelectionRectArray[i] = new Rect(panelOne, "0", "0", "%100", "f1/5");
    songSelectionRectArray[i].rectColor = color(0,255,255);
    songSelectionRectArray[i].rectID = i;
  }
  
  drawSongSelectionRects();
}
//END SETUP

 





//DRAW
void draw() {
  drawButtons();
  autoPlay();
  
} //END DRAW


void keyPressed() {
  if(key == 'u' || key == 'U'){
    if((songLevel + 1)* 5 <= songList.length){
      songLevel++;
      println(songLevel);
      drawSongSelectionRects();
    }
  }
  if(key == 'i' || key == 'I'){
    if(songLevel > 0){
      songLevel--;
      println(songLevel);
      drawSongSelectionRects();
    }
  }
} //End keyPressed

void mousePressed() {
  //println("mouse clicked");
  if(quitButtonRect.isHovering() == true){
    println("quit button has been clicked");
    System.exit(0);
  }
  if(playButton.isHoveringCircle() == true){
    if( song.isPlaying() == true){
      song.pause();
      isPaused = true;
    }
    else{
      song.play();
      isPaused = false;
    }
  }
    
  if(lastSongButton.isHoveringCircle() == true){
    if(currentSong > 0){
      println("Previous Song!");
      song.pause();
      currentSong --;
      song = minim.loadFile(songList[currentSong]);
      song.rewind();
      song.play();
    }
  }
  
  if(nextSongButton.isHoveringCircle() == true){
    if(currentSong + 1 < Array.getLength(songList)){
      println("Next Song!");
      song.pause();
      currentSong++;
      song = minim.loadFile(songList[currentSong]);
      song.rewind();
      song.play();
    }
  }   
  
  if(songLevel * 5 + 5 > songSelectionRectArray.length){
    for(int i = 5 * songLevel; i < songSelectionRectArray.length; i++){
      if(songSelectionRectArray[i].isHovering() == true){
        song.pause();
        song.rewind();
        currentSong = songSelectionRectArray[i].rectID;
        song = minim.loadFile(songList[currentSong]);
        song.rewind();
        song.play();
      }
    }
  }
  else{
    for(int i = 5 * songLevel; i < 5 * songLevel + 5; i++){
      if(songSelectionRectArray[i].isHovering() == true){
        song.pause();
        song.rewind();
        currentSong = songSelectionRectArray[i].rectID;
        song = minim.loadFile(songList[currentSong]);
        song.rewind();
        song.play();
      }
    }
  }
  
  if(musicButtonRect.isHovering() == true){
    selectedPanelUse = 1;
  }
  
  if(settingsButtonRect.isHovering() == true){
    selectedPanelUse = 2;
  }
} //End mousePressed

// End MAIN Program
