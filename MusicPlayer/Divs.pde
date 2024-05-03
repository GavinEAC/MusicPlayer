//Div Rects
parentRect backgroundRect;
Rect topBarRect;
Rect panelOne;
Rect panelTwo;
Rect panelThree;
Rect albumCoverRect;
Rect songTextRect;

//Buttons Rects
Rect settingsButtonRect;
Rect musicButtonRect;
Rect uploadButtonRect;
Rect quitButtonRect;
Rect lastSongButton;
Rect playButton;
Rect nextSongButton;

void createDivs(){
  backgroundRect = new parentRect();
  topBarRect = new Rect(backgroundRect, "0", "0", "%100", "%10");
  panelOne = new Rect(backgroundRect, "0", "%10", "f1/4", "%90");
  panelTwo = new Rect(backgroundRect, "f1/4", "%10", "f1/2", "%90");
  panelThree = new Rect(backgroundRect, "f3/4", "%10", "f1/4", "%90");
  albumCoverRect = new Rect(panelTwo, "%25", "%20", "%50", "%50");
  songTextRect = new Rect(panelTwo, "%25", "f697/1000", "%50", "%10");
}

void setDivColors(){
  topBarRect.rectColor = color(255,255,255);
  panelOne.rectColor = color(255,0,0);
  panelTwo.rectColor = color(0,255,0);
  panelThree.rectColor = color(0,0,255);
  albumCoverRect.rectColor = color(255,255,255);
  songTextRect.rectColor = color(255,255,255);
}

void drawDivs(){
  topBarRect.drawRect();
  panelOne.drawRect();
  panelTwo.drawRect();
  albumCoverRect.drawRect();
  panelThree.drawRect();
  songTextRect.drawRect();
}

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
