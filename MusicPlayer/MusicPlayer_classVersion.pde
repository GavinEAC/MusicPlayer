import ddf.minim.*;
import java.lang.reflect.Array;  
import java.util.Arrays;  
import java.io.*;

//GLOBAL VARIABLES
int appWidth, appHeight;
boolean isPaused;



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
  //size(400, 500); //width, height (non fullscreen is not supported in this version
  fullScreen(); //displayWidth, displayHeight
  appWidth = displayWidth;
  appHeight = displayHeight;
  println(displayWidth, displayHeight);
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "No, fix your device"; 
  println(displayInstructions);
  
  assets = loadFont("SegoeMDL2Assets-48.vlw");
  defaultFont = createFont("OpenSans-Bold.ttf", 48, true);
  
  //See Divs File For What the Functions Do
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
  if(quitButtonRect.isHovering() == true){
    quitButtonRect.rectColor = color(255,0,0);
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2, 72);
  }
  else{
    quitButtonRect.rectColor = color(255,255,255);
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2, 72);
  }
  
  if(settingsButtonRect.isHovering() == true){
    settingsButtonRect.rectColor = color(255,0,0);
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2, 72);
  }
  else{
    settingsButtonRect.rectColor = color(255,255,255);
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2, 72);
  }
  
  if(musicButtonRect.isHovering() == true){
    musicButtonRect.rectColor = color(255,0,0);
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2, 72);
  }
  else{
    musicButtonRect.rectColor = color(255,255,255);
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2, 72);
  }
  
  if(uploadButtonRect.isHovering() == true){
    uploadButtonRect.rectColor = color(255,0,0);
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2, 72);
  }
  else{
     uploadButtonRect.rectColor = color(255,255,255);
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2, 72);
  }
  
  if(playButton.isHoveringCircle() == true){
    playButton.rectColor = color(230,230,230);
    playButton.drawCircle();
    if(song.isPlaying() == true){
      printAsset("\uF8AE", playButton.rectX, playButton.rectY, 30);
    }
    else{
      printAsset("\uF5B0", playButton.rectX, playButton.rectY, 30);
    }
  }
  else{
    playButton.rectColor = color(255,255,255);
    playButton.drawCircle();
    if(song.isPlaying() == true){
      printAsset("\uF8AE", playButton.rectX, playButton.rectY, 30);
    }
    else{
      printAsset("\uF5B0", playButton.rectX, playButton.rectY, 30);
    }
  }
  
  if(lastSongButton.isHoveringCircle() == true){
    lastSongButton.rectColor = color(230,230,230);
    lastSongButton.drawCircle();
    printAsset("\uF8AC", lastSongButton.rectX, lastSongButton.rectY, 30);
    }
  else{
    lastSongButton.rectColor = color(255,255,255);
    lastSongButton.drawCircle();
    printAsset("\uF8AC", lastSongButton.rectX, lastSongButton.rectY, 30);
  }
  
  if(nextSongButton.isHoveringCircle() == true){
    nextSongButton.rectColor = color(230,230,230);
    nextSongButton.drawCircle();
    printAsset("\uF8AD", nextSongButton.rectX, nextSongButton.rectY, 30);
  }
  else{
    nextSongButton.rectColor = color(255,255,255);
    nextSongButton.drawCircle();
    printAsset("\uF8AD", nextSongButton.rectX, nextSongButton.rectY, 30);
  }
 
  autoPlay();
  
} //END DRAW


void keyPressed() {
  if(key == 'u' || key == 'U'){
    songLevel++;
    println(songLevel);
    drawSongSelectionRects();
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
  
  for(int i = 0; i < songSelectionRectArray.length; i++){
    //TODO MANAGE SONG SELECTION OVERLAY BUG DO IT SOOOOON
    if(songSelectionRectArray[i].isHovering() == true){
      song.pause();
      song.rewind();
      currentSong = songSelectionRectArray[i].rectID;
      song = minim.loadFile(songList[currentSong]);
      song.rewind();
      song.play();
    }
  }
} //End mousePressed

// End MAIN Program
