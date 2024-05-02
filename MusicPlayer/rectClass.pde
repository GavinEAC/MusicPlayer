class parentRect{
  int rectX = 0;
  int rectY = 0;
  int rectWidth = displayWidth;
  int rectHeight = displayHeight;

  parentRect(){
    noFill();
    noStroke();
    rect(rectX, rectY, rectWidth, rectHeight);
  }
    
}

class Rect{
  int rectID; //used for drawing songs in panel one(Which are created in a loop)
  float rectX;
  float rectY;
  float rectWidth;
  float rectHeight;
  color rectColor;
  Rect rectParent;
  parentRect rectMainParent;
  
  //CONSTRUCTOR FOR GRANDCHILDREN OF MAIN RECT AND ON
  Rect(Rect parent, String x, String y, String Width, String Height){
    //establishes parent rect
    rectParent = parent;
    
    
    //Mananges x,y,height,width
    if( x.contains("%") == true) {
      float percentValue = Integer.parseInt(x.substring(1));
      percentValue = percentValue/100;
      rectX = (percentValue * parent.rectWidth) + parent.rectX;
    }
    else if( x.contains("f") == true){
      String stringFractionValue = x.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectX = (floatFractionValue * parent.rectWidth) + parent.rectX;
    }
    else{
      rectX = (Integer.parseInt(x) * parent.rectWidth) + parent.rectX;
    }
    
    if( y.contains("%") == true) {
      float percentValue = Integer.parseInt(y.substring(1));
      percentValue = percentValue/100;
      rectY = (percentValue * parent.rectHeight) + parent.rectY;
    }
    else if( y.contains("f") == true){
      String stringFractionValue = y.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectY= (floatFractionValue * parent.rectHeight) + parent.rectY;
    }
    else{
      rectY = (Integer.parseInt(y) * parent.rectHeight) + parent.rectY;
    }
   
    if( Width.contains("%") == true) {
      float percentValue = Integer.parseInt(Width.substring(1));
      percentValue = percentValue/100;
      rectWidth = percentValue * parent.rectWidth;
    }
    else if( Width.contains("f") == true){
      String stringFractionValue = Width.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectWidth = floatFractionValue * parent.rectWidth;
    }
    else{
      rectWidth = Integer.parseInt(Width);
    }
    
    if( Height.contains("%") == true) {
      float percentValue = Integer.parseInt(Height.substring(1));
      percentValue = percentValue/100;
      rectHeight = percentValue * parent.rectHeight;
    }
    else if( Height.contains("f") == true){
      String stringFractionValue = Height.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectHeight= floatFractionValue * parent.rectHeight;
    }
    else{
      rectHeight = Integer.parseInt(Height);
    }
    
    //defaulted settings of a rect object
    rectColor = color(255,255,255);
    
  }
  //
  //
  //
  //CONSTRUCTOR FOR RECTS THAT BELONG TO MAIN RECT
  //
  //
  //
  Rect(parentRect parent, String x, String y, String Width, String Height){
    
    rectMainParent = parent;
    
    if( x.contains("%") == true) {
      float percentValue = Integer.parseInt(x.substring(1));
      percentValue = percentValue/100;
      rectX = percentValue * parent.rectWidth;
    }
    else if( x.contains("f") == true){
      String stringFractionValue = x.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectX = floatFractionValue * parent.rectWidth;
    }
    else{
      rectX = Integer.parseInt(x);
    }
    
    if( y.contains("%") == true) {
      float percentValue = Integer.parseInt(y.substring(1));
      percentValue = percentValue/100;
      rectY = percentValue * parent.rectHeight;
    }
    else if( y.contains("f") == true){
      String stringFractionValue = y.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectY= floatFractionValue * parent.rectHeight;
    }
    else{
      rectY = Integer.parseInt(y);
    }
   
    if( Width.contains("%") == true) {
      float percentValue = Integer.parseInt(Width.substring(1));
      percentValue = percentValue/100;
      rectWidth = percentValue * parent.rectWidth;
    }
    else if( Width.contains("f") == true){
      String stringFractionValue = Width.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectWidth = floatFractionValue * parent.rectWidth;
    }
    else{
      rectWidth = Integer.parseInt(Width);
    }
    
    if( Height.contains("%") == true) {
      float percentValue = Integer.parseInt(Height.substring(1));
      percentValue = percentValue/100;
      rectHeight = percentValue * parent.rectHeight;
    }
    else if( Height.contains("f") == true){
      String stringFractionValue = Height.substring(1);
      String[] indFractionValues = stringFractionValue.split("/");
      float numerator = Integer.parseInt(indFractionValues[0]);
      float denominator = Integer.parseInt(indFractionValues[1]);
      float floatFractionValue = numerator / denominator;
      rectHeight = floatFractionValue * parent.rectHeight;
    }
    else{
      rectHeight = Integer.parseInt(Height);
   }
    
    //defaulted settings of a rect object
    rectColor = color(255,255,255);
    
  }
  
  //draws rect starting from center. x,y is postiioned in center of rect
  void centralDrawMode(){
    rectX = rectX - (rectWidth/2);
    rectY = rectY - (rectHeight/2);
  }
  
  boolean isHovering(){
    if(mouseX >= rectX && mouseX <= rectWidth + rectX && mouseY >= rectY && mouseY <= rectY + rectHeight){
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean isHoveringCircle(){
    if( mouseX > rectX - rectWidth/2 && mouseX < rectX + rectWidth/2 && mouseY > rectY - rectWidth/2 && mouseY < rectY + rectWidth/2) {
      return true;
    }
    else{
      return false;
    }
  }
    
  void printArgs(){
    println(rectX, rectY, rectWidth, rectHeight);
  }
  
  void drawRect(){
    fill(rectColor);
    rect(rectX, rectY, rectWidth, rectHeight);
  }
  
  void drawImage(String imageAdress){
    PImage image = loadImage(imageAdress);
    image(image, rectX, rectY, rectWidth, rectHeight);
  }
  
  void drawCircle(){
    fill(rectColor);
    circle(rectX, rectY, rectWidth);
  }
}

 
