//Div Rects
parentRect backgroundRect;
Rect topBarRect;
Rect panelOne;
Rect panelTwo;
Rect panelThree;
Rect albumCoverRect;
Rect songTextRect;



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
  topBarRect.rectColor = currentTheme[0];
  panelOne.rectColor = currentTheme[4];
  panelTwo.rectColor = currentTheme[5];
  panelThree.rectColor = currentTheme[6];
  //These dont normaly appear so they dont get a theme colour attribute
  albumCoverRect.rectColor = color(255,255,255);
  songTextRect.rectColor = color(255,255,255);
}

void drawDivs(){
  topBarRect.drawRect();
  panelOne.drawRect();
  panelTwo.drawRect();
  strokeWeight(10);
  albumCoverRect.drawRect();
  strokeWeight(4);
  panelThree.drawRect();
  songTextRect.drawRect();
}
