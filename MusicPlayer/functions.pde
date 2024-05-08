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
