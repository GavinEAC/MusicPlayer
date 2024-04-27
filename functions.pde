
//Use this site as reference for asset unicode points:
//https://learn.microsoft.com/en-us/windows/apps/design/style/segoe-ui-symbol-font
void printAsset (String asset, float x, float y){
  fill(0,0,0);
  textFont(assets);
  textSize(72);
  textAlign(CENTER, CENTER);
  text(asset, x, y);
}
