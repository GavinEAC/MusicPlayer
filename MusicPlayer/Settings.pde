//Header Rects
Rect settingsHeader;
Rect themeSelection;

//Button Rects
Rect darkModeThemeButton;
Rect lightModeThemeButton;
Rect pinkThemeButton;

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
  darkModeThemeButton = new Rect(panelOne, "0", "%14", "%100", "%5");
  lightModeThemeButton = new Rect(panelOne, "0", "%20", "%100", "%5");
  pinkThemeButton = new Rect(panelOne, "0", "%26", "%100", "%5");
}

void drawSettingsButtons(){
  darkModeThemeButton.rectColor = color(255,255,255);
  darkModeThemeButton.drawRect();
  lightModeThemeButton.rectColor = color(255,255,255);
  lightModeThemeButton.drawRect();
  pinkThemeButton.rectColor = color(255,255,255);
  pinkThemeButton.drawRect();
  
}
