//
//Im a programmer, not a graphic designer. I tried my best 
//

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
  //topBarColor
  color(20,20,20),
  //topBarButtonHoverColor
  color(255,255,255),
  //topBarButtonAssetHoverColor
  color(20,20,20),
  // topBarButtonAssetColor
  color(255,255,255),
  //panelOneColor
  color(40,40,40),
  //panelTwoColor
  color(60,60,60),
  //panelThreeColor
  color(40,40,40),
  // musicControlButtonsColor
  color(40,60,40),
  //musicControlButtonsHoverColor
  color(60,60,80),
  // musicControlButtonsAssetColor
  color(255,255,255),
  // musicControlButtonsAssetHoverColor
  color(255,255,255),
  //songSelectionRectColor
  color(60,60,80),
  // songSelectionRectTextColor
  color(255,255,255)
};

color[] lightModeTheme = new color[]{
  //topBarColor
  color(72,75,106),
  //topBarButtonHoverColor
  color(147,148,165),
  //topBarButtonAssetHoverColor
  color(0,0,0),
  // topBarButtonAssetColor
  color(255,255,255),
  //panelOneColor
  color(255,255,255),
  //panelTwoColor
  color(228,229,241),
  //panelThreeColor
  color(255,255,255),
  // musicControlButtonsColor
  color(72,75,106),
  //musicControlButtonsHoverColor
  color(147,148,165),
  // musicControlButtonsAssetColor
  color(255,255,255),
  // musicControlButtonsAssetHoverColor
  color(0,0,0),
  //songSelectionRectColor
  color(207, 207, 209),
  // songSelectionRectTextColor
  color(0,0,0)
};

color[] pinkTheme = new color[]{
  //topBarColor
  color(254, 105, 148),
  //topBarButtonHoverColor
  color(254,190, 204),
  //topBarButtonAssetHoverColor
  color(0,0,0),
  // topBarButtonAssetColor
  color(0,0,0),
  //panelOneColor
  color(254,177,183),
  //panelTwoColor
  color(253, 120, 139),
  //panelThreeColor
  color(254,177,183),
  // musicControlButtonsColor
  color(274, 125, 168),
  //musicControlButtonsHoverColor
  color(254,190, 204),
  // musicControlButtonsAssetColor
  color(255,255,255),
  // musicControlButtonsAssetHoverColor
  color(0,0,0),
  //songSelectionRectColor
  color(227, 94, 94),
  // songSelectionRectTextColor
  color(0,0,0)
};
  
void setTheme(color[] theme){
  for(int i = 0; i < theme.length; i++){
    currentTheme[i] = theme[i];
  }
}
