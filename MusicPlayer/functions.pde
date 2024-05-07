//Use this site as reference for asset unicode points:
//https://learn.microsoft.com/en-us/windows/apps/design/style/segoe-ui-symbol-font
void printAsset(String asset, float x, float y, int textSize, color assetColor){
  fill(assetColor);
  textFont(assets);
  textSize(textSize);
  textAlign(CENTER, CENTER);
  text(asset, x, y);
}

//Automatically Plays next qeued song or loops to start
void autoPlay(){
  if(song.position() > 0 && isPaused == false && song.isPlaying() == false){
    if(currentSong + 1 < Array.getLength(songList)){
      song.pause();
      currentSong++;
      song = minim.loadFile(songList[currentSong ]);
      song.rewind();
      song.play();
    }
    else{
      song.pause();
      currentSong = 0;
      song = minim.loadFile(songList[currentSong ]);
      song.rewind();
      song.play();
    }
  }
}

void drawSongSelectionRects(){
  if(songLevel * 5 + 5 > songSelectionRectArray.length){
    panelOne.drawRect();
    for(int i = 5 * songLevel; i < songSelectionRectArray.length; i++){
        songSelectionRectArray[i].rectY= songSelectionRectArray[i].rectHeight * (i - 5) + topBarRect.rectHeight;
        songSelectionRectArray[i].drawRect();
        textFont(defaultFont);
        textAlign(LEFT);
        textSize(24);
        fill(0,0,0);
        text(songList[i], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 30);
        text("songID: " + songSelectionRectArray[i].rectID, songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 60);
      }
  }
  else{
    for(int i = 5 * songLevel; i < 5 * songLevel + 5; i++){
      songSelectionRectArray[i].rectY= songSelectionRectArray[i].rectHeight * i + topBarRect.rectHeight;
      songSelectionRectArray[i].drawRect();
      textFont(defaultFont);
      textAlign(LEFT);
      textSize(24);
      fill(0,0,0);
      text(songList[i], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 30);
      text("songID: " + songSelectionRectArray[i].rectID, songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 60);
    }
  }
}
  
