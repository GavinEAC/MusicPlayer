Rect settingsHeader;
Rect themeSelection;

void createSettingsRects(){
  settingsHeader = new Rect(panelOne, "0", "0", "%100", "%7");
  themeSelection = new Rect(panelOne, "0", "%9", "%100", "%5");
}



void drawSettingsRects(){
  //Usually I only Want the text to show Up for this so draw method is commented out( only use for debugging)
  //settingsHeader.drawRect();
  textAlign(CENTER, CENTER);
  fill(255, 255, 255);
  textFont(defaultFont);
  textSize(48);
  text("SETTINGS", settingsHeader.rectWidth / 2 , settingsHeader.rectHeight / 2 + settingsHeader.rectY);
  
  //themeSelection.drawRect();
  textAlign(LEFT, CENTER);
  fill(255, 255, 255);
  textFont(defaultFont);
  textSize(24);
  text("THEME", themeSelection.rectX, themeSelection.rectHeight / 2 + themeSelection.rectY);
}

void createSettingsButtons(){
  
}

void drawSettingsButtons(){
  
}
