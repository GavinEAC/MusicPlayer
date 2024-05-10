//Misc. Variables i guess
int chosenTheme = 2;

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
  fill(currentTheme[13]);
  textFont(defaultFont);
  textSize(48);
  text("SETTINGS", settingsHeader.rectWidth / 2 , settingsHeader.rectHeight / 2 + settingsHeader.rectY);
  
  //themeSelection.drawRect();
  textAlign(LEFT, CENTER);
  fill(currentTheme[13]);
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
  if(darkModeThemeButton.isHovering() == true || chosenTheme == 2){
    darkModeThemeButton.rectColor = currentTheme[0];
    darkModeThemeButton.drawRect();
    fill(currentTheme[1]);
    text("Dark Mode", darkModeThemeButton.rectX, darkModeThemeButton.rectHeight / 2 + darkModeThemeButton.rectY);
  }
  else{
    darkModeThemeButton.rectColor = currentTheme[5];
    darkModeThemeButton.drawRect();
    fill(currentTheme[2]);
    text("Dark Mode", darkModeThemeButton.rectX, darkModeThemeButton.rectHeight / 2 + darkModeThemeButton.rectY);
  }
  if(lightModeThemeButton.isHovering() == true || chosenTheme == 1){
    lightModeThemeButton.rectColor = currentTheme[0];
    lightModeThemeButton.drawRect();
    fill(currentTheme[1]);
    text("Light Mode", lightModeThemeButton.rectX, lightModeThemeButton.rectHeight / 2 + lightModeThemeButton.rectY);
  }
  else{
    lightModeThemeButton.rectColor = currentTheme[5];
    lightModeThemeButton.drawRect();
    fill(currentTheme[2]);
    text("Light Mode", lightModeThemeButton.rectX, lightModeThemeButton.rectHeight / 2 + lightModeThemeButton.rectY);
  }
  
  if(pinkThemeButton.isHovering() == true || chosenTheme == 3){
    pinkThemeButton.rectColor = currentTheme[0];
    pinkThemeButton.drawRect();
    fill(currentTheme[1]);
    text("PINK MODE", pinkThemeButton.rectX, pinkThemeButton.rectHeight / 2 + pinkThemeButton.rectY);
  }
  else{
    pinkThemeButton.rectColor = currentTheme[5];
    pinkThemeButton.drawRect();
    fill(currentTheme[2]);
    text("PINK MODE", pinkThemeButton.rectX, pinkThemeButton.rectHeight / 2 + pinkThemeButton.rectY);
  }
}
