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
      songMetaData = song.getMetaData();
      song.rewind();
      song.play();
    }
    else{
      song.pause();
      currentSong = 0;
      song = minim.loadFile(songList[currentSong ]);
      songMetaData = song.getMetaData();
      song.rewind();
      song.play();
    }
  }
}

void printSongInfo(){
  textAlign(LEFT, CENTER);
  String songName;
  String songArtist;
  
  if(songMetaData.title() != ""){
    songName = songMetaData.title();
  }
  else{
     songName = "[Title Not Found]";
  }
  int songNameSize = 24;
  
  if(songMetaData.title() != ""){
    songArtist = songMetaData.author();
  }
  else{
     songArtist = "[Artist Not Found]";
  }
  int songArtistSize = 18;
  
  int songDurationMinutes = songMetaData.length()/1000/60;
  int songDurationSeconds = (songMetaData.length()/1000) - (songMetaData.length()/1000/60) * 60;
  String songDuration = String.valueOf(songDurationMinutes) + ":" + String.valueOf(songDurationSeconds);
  int songDurationSize = 12;
  
  songTextRect.drawRect();
  
  textFont(defaultFont);
  fill(255,255,255);
  textSize(songNameSize);
  text(songName, songTextRect.rectX, songTextRect.rectY + songNameSize);
  
  textSize(songDurationSize);
  text(songDuration, songTextRect.rectX + textWidth(songName)*2.1, songTextRect.rectY + songNameSize);
  
  textSize(songArtistSize);
  text(songArtist, songTextRect.rectX, songTextRect.rectY + songNameSize + songArtistSize);
}
  
