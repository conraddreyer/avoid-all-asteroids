class Base{
  PVector pos;
  int size;
  int baseFill = color(127);
  int baseStroke = color(0,180,220);
  
  Base(float posX, float posY, int size_){
    pos = new PVector(posX, posY);
    size = size_;
  }
  
  void display(){
    fill(baseFill);
    stroke(baseStroke);
    ellipse(pos.x, pos.y, size, size);
  }
}
