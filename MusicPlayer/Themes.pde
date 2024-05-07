/*
COLOURS NEEDED
TopBar
TopBar Button Hover Color
panel one back
panel two back
panel three back
pause play etc button
pause play etc button hover colour 
album cover outline color(Maybe if i can make it show up)
song selection rects
top bar asset color 
pause Play etc button asset color
*/

color topBarColor;
color topBarButtonHoverColor;
color topBarButtonAssetColor;
color topBarButtonAssetHoverColor;
color panelOneColor;
color panelTwoColor;
color panelThreeColor;
color musicControlButtonsColor;
color musicControlButtonsHoverColor;
color musicControlButtonsAssetColor;
color musicControlButtonsAssetHoverColor;
color songSelectionRectColor;
color songSelectionRectTextColor;
color[] currentTheme = new color[] {
  topBarColor,
  topBarButtonHoverColor,
  topBarButtonAssetHoverColor,
  topBarButtonAssetColor,
  panelOneColor,
  panelTwoColor,
  panelThreeColor,
  musicControlButtonsColor,
  musicControlButtonsHoverColor,
  musicControlButtonsAssetColor,
  musicControlButtonsAssetHoverColor,
  songSelectionRectColor,
  songSelectionRectTextColor
};

color[] darkModeTheme = new color[]{
  color(20,20,20),
  color(255,255,255),
  color(20,20,20),
  color(255,255,255),
  color(40,40,40),
  color(60,60,60),
  color(40,40,40),
  color(40,60,40),
  color(60,60,80),
  color(255,255,255),
  color(255,255,255),
  color(60,60,80),
  color(255,255,255)
};

void function(){
  for(int i = 0; i < currentTheme.length; i++){
      println(i , currentTheme[i]);
  }
}

void setTheme(color[] theme){
  for(int i = 0; i < theme.length; i++){
    currentTheme[i] = theme[i];
  }
}
