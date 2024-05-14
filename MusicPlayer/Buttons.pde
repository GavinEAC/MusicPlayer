//Buttons Rects
Rect settingsButtonRect;
Rect musicButtonRect;
Rect uploadButtonRect;
Rect quitButtonRect;
Rect lastSongButton;
Rect playButton;
Rect nextSongButton;

//Instantiates Buttons for top bar and music Control
void createButtons(){
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
  
  lastSongButton = new Rect(panelTwo, "%40", "%90", "%7", "0");
  playButton = new Rect(panelTwo, "%50", "%90", "%10", "0");
  nextSongButton = new Rect(panelTwo, "%60", "%90", "%7", "0");
}

//Draw Buttons for top bar and music Control( and manages hover detection)
void drawButtons(){
  if(quitButtonRect.isHovering() == true){
    quitButtonRect.rectColor = currentTheme[1];
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2, 72, color(255,0,0));
  }
  else{
    quitButtonRect.rectColor = currentTheme[topBarColor];
    quitButtonRect.drawRect();
    printAsset("\uE8BB", (quitButtonRect.rectX + quitButtonRect.rectWidth / 2), (quitButtonRect.rectY + quitButtonRect.rectHeight) / 2, 72, currentTheme[3]);
  }
  
  if(settingsButtonRect.isHovering() == true || selectedPanelUse == 2){
    settingsButtonRect.rectColor = currentTheme[1];
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2, 72, currentTheme[2]);
  }
  else{
    settingsButtonRect.rectColor = currentTheme[topBarColor];
    settingsButtonRect.drawRect();
    printAsset("\uE713", (settingsButtonRect.rectX + settingsButtonRect.rectWidth / 2), (settingsButtonRect.rectY + settingsButtonRect.rectHeight) / 2, 72, currentTheme[3]);
  }
  
  if(musicButtonRect.isHovering() == true || selectedPanelUse == 1){
    musicButtonRect.rectColor = currentTheme[1];
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2, 72, currentTheme[2]);
  }
  else{
    musicButtonRect.rectColor = currentTheme[topBarColor];
    musicButtonRect.drawRect();
    printAsset("\uEC4F", (musicButtonRect.rectX + musicButtonRect.rectWidth / 2), (musicButtonRect.rectY + musicButtonRect.rectHeight) / 2, 72, currentTheme[3]);
  }
  
  if(uploadButtonRect.isHovering() == true){
    uploadButtonRect.rectColor = currentTheme[1];
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2, 72, currentTheme[2]);
  }
  else{
     uploadButtonRect.rectColor = currentTheme[topBarColor];
    uploadButtonRect.drawRect();
    printAsset("\uE898", (uploadButtonRect.rectX + uploadButtonRect.rectWidth / 2), (uploadButtonRect.rectY + uploadButtonRect.rectHeight) / 2, 72, currentTheme[3]);
  }
  
  if(playButton.isHoveringCircle() == true){
    playButton.rectColor = currentTheme[8];
    playButton.drawCircle();
    if(song.isPlaying() == true){
      printAsset("\uF8AE", playButton.rectX, playButton.rectY, 30,  currentTheme[10]);
    }
    else{
      printAsset("\uF5B0", playButton.rectX, playButton.rectY, 30, currentTheme[10]);
    }
  }
  else{
    playButton.rectColor = currentTheme[7];
    playButton.drawCircle();
    if(song.isPlaying() == true){
      printAsset("\uF8AE", playButton.rectX, playButton.rectY, 30,  currentTheme[9]);
    }
    else{
      printAsset("\uF5B0", playButton.rectX, playButton.rectY, 30,  currentTheme[9]);
    }
  }
  
  if(lastSongButton.isHoveringCircle() == true){
    lastSongButton.rectColor = currentTheme[8];
    lastSongButton.drawCircle();
    printAsset("\uF8AC", lastSongButton.rectX, lastSongButton.rectY, 30,  currentTheme[10]);
    }
  else{
    lastSongButton.rectColor = currentTheme[7];
    lastSongButton.drawCircle();
    printAsset("\uF8AC", lastSongButton.rectX, lastSongButton.rectY, 30,  currentTheme[9]);
  }
  
  if(nextSongButton.isHoveringCircle() == true){
    nextSongButton.rectColor = currentTheme[8];
    nextSongButton.drawCircle();
    printAsset("\uF8AD", nextSongButton.rectX, nextSongButton.rectY, 30,  currentTheme[10]);
  }
  else{
    nextSongButton.rectColor = currentTheme[7];
    nextSongButton.drawCircle();
    printAsset("\uF8AD", nextSongButton.rectX, nextSongButton.rectY, 30 , currentTheme[9]);
  }
}

void createSongSelectionRects(){
  for(int i = 0; i < listOfFiles.length; i++){
    songSelectionRectArray[i] = new Rect(panelOne, "0", "0", "%100", "f1/5");
    songSelectionRectArray[i].rectColor = color(0,255,255);
    songSelectionRectArray[i].rectID = i;
  }
}

//Creates an array of rects which correspond to each song in songList
void drawSongSelectionRects(){
  if(songLevel * 5 + 5 > songSelectionRectArray.length){
    panelOne.drawRect();
    for(int i = 5 * songLevel; i < songSelectionRectArray.length; i++){
        songSelectionRectArray[i].rectY= songSelectionRectArray[i].rectHeight * (i - 5) + topBarRect.rectHeight;
        songSelectionRectArray[i].rectColor = currentTheme[11];
        songSelectionRectArray[i].drawRect();
        textFont(defaultFont);
        textAlign(LEFT);
        textSize(24);
        fill(currentTheme[12]);
        text(songSelectionRectInfoArray[i][0], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 30);
        textSize(20);
        text(songSelectionRectInfoArray[i][2], songSelectionRectArray[i].rectWidth - (textWidth(songSelectionRectInfoArray[i][2]) + 20), songSelectionRectArray[i].rectY + 30);
        text(songSelectionRectInfoArray[i][1], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 60);
      }
  }
  else{
    for(int i = 5 * songLevel; i < 5 * songLevel + 5; i++){
      songSelectionRectArray[i].rectY= songSelectionRectArray[i].rectHeight * i + topBarRect.rectHeight;
      songSelectionRectArray[i].rectColor = currentTheme[11];
      songSelectionRectArray[i].drawRect();
      textFont(defaultFont);
      textAlign(LEFT);
      textSize(24);
      fill(currentTheme[12]);
      text(songSelectionRectInfoArray[i][0], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 30);
      textSize(20);
      text(songSelectionRectInfoArray[i][2], songSelectionRectArray[i].rectWidth - (textWidth(songSelectionRectInfoArray[i][2]) + 20), songSelectionRectArray[i].rectY + 30);
      text(songSelectionRectInfoArray[i][1], songSelectionRectArray[i].rectX, songSelectionRectArray[i].rectY + 60);
    }
  }
}



  
