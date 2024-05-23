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
  
  int songDuration = songMetaData.length();
  int songPosition = song.position();
  int songTimeRemainder = songDuration - songPosition;
  String songTimeRemainderString;
  if(( songTimeRemainder/1000 - ( songTimeRemainder/1000/60)*60 ) < 10){
    songTimeRemainderString = songTimeRemainder/1000/60 + ":" + "0" + ( songTimeRemainder/1000 - ( songTimeRemainder/1000/60)*60 );
  }
  else{
    songTimeRemainderString = songTimeRemainder/1000/60 + ":" + ( songTimeRemainder/1000 - ( songTimeRemainder/1000/60)*60 );
  }

  int songTimeRemainderSize = 12;
  
  songTextRect.drawRect();
  
  textFont(defaultFont);
  fill(currentTheme[2]);
  textSize(songNameSize);
  text(songName, songTextRect.rectX, songTextRect.rectY + songNameSize);
  
  textSize(songTimeRemainderSize);
  text(songTimeRemainderString, songTextRect.rectX + textWidth(songName)*2.1, songTextRect.rectY + songNameSize);
  
  textSize(songArtistSize);
  text(songArtist, songTextRect.rectX, songTextRect.rectY + songNameSize + songArtistSize);
}

void fileSelected(File selection){
  if(selection == null){
    println("no value given");
  }
  else{
    println(selection);
  }
}
