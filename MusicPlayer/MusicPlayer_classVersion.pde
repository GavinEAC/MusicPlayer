import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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
AudioMetaData songMetaData;

String[] songList;
int currentSong;
Rect[] songSelectionRectArray;
String[][] songSelectionRectInfoArray;
int songLevel = 0;
String[] listOfFiles;


//SETUP
void setup() {
  setTheme(darkModeTheme);
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
  selectedPanelUse = 1;
  albumCoverRect.drawImage("demoAlbumCover.jpg");
  createButtons();
  //Buttons are drawn in draw Function, so its not needed here
  
 
  
  //Loads Songs from music folder and adds them to an array
  String path = sketchPath("data/music");
  File musicDir = new File(path);
  listOfFiles = musicDir.list();
  for(int i = 0; i < listOfFiles.length; i++){
    listOfFiles[i] = "music/" + listOfFiles[i];
  }
  
  //instantiates minim stuff
  minim = new Minim(this);
  songList = listOfFiles;
  currentSong = 0;
  song = minim.loadFile(songList[currentSong]);
  songMetaData = song.getMetaData();
  songSelectionRectArray = new Rect[songList.length];
  
  songSelectionRectInfoArray = new String[songList.length][3];
  
  createSongSelectionRectInfo();
  createSongSelectionRects();
  drawSongSelectionRects();
  
  //drawn in Void Draw also
  createSettingsRects();
  
  //drawn in Void Draw
  
  createSettingsButtons();
  //drawn in Void Draw
  
 createProgressBar();
 //drawn in Void Draw
 
}
//END SETUP

 





//DRAW
void draw() {
  
  printSongInfo();
  drawProgressBar();
  panelOne.drawRect();
  if(selectedPanelUse == 1){
    drawSongSelectionRects();
  } 
  else if(selectedPanelUse == 2){
    drawSettingsRects();
    drawSettingsButtons();
  }
  drawButtons();
  autoPlay();
  
} //END DRAW


void keyPressed() {
  if(selectedPanelUse == 1){
    if(key == 'u' || key == 'U'){
      if((songLevel + 1)* 5 <= songList.length){
        songLevel++;
        drawSongSelectionRects();
      }
    }
    if(key == 'i' || key == 'I'){
      if(songLevel > 0){
        songLevel--;
        drawSongSelectionRects();
      }
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
      songMetaData = song.getMetaData();
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
      songMetaData = song.getMetaData();
      song.rewind();
      song.play();
    }
  }   
  if(selectedPanelUse == 1){
    if(songLevel * 5 + 5 > songSelectionRectArray.length){
      for(int i = 5 * songLevel; i < songSelectionRectArray.length; i++){
        if(songSelectionRectArray[i].isHovering() == true){
          song.pause();
          song.rewind();
          currentSong = songSelectionRectArray[i].rectID;
          song = minim.loadFile(songList[currentSong]);
          songMetaData = song.getMetaData();
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
          songMetaData = song.getMetaData();
          song.rewind();
          song.play();
        }
      }
    }
  }
  
  if(musicButtonRect.isHovering() == true){
    selectedPanelUse = 1;
  }
  
  if(settingsButtonRect.isHovering() == true){
    selectedPanelUse = 2;
  }
  
  if(darkModeThemeButton.isHovering() == true  && selectedPanelUse == 2){
    chosenTheme = 2;
    setTheme(darkModeTheme);
    setDivColors();
    drawDivs();
    albumCoverRect.drawImage("demoAlbumCover.jpg");
  }
  if(lightModeThemeButton.isHovering() == true && selectedPanelUse == 2){
    chosenTheme = 1;
    setTheme(lightModeTheme);
    setDivColors();
    drawDivs();
    albumCoverRect.drawImage("demoAlbumCover.jpg");
  }
  if(pinkThemeButton.isHovering() == true && selectedPanelUse == 2){
    chosenTheme = 3;
    setTheme(pinkTheme);
    setDivColors();
    drawDivs();
    albumCoverRect.drawImage("demoAlbumCover.jpg");
  }
} //End mousePressed

// End MAIN Program
