// Target function
float f(float x) {
  // y = mx + b
  return 0.89 * x - 0.1;
  
}

class Point {
  float x;
  float y;
  float bias = 1;
  int label;
  
  Point(){
    x = random(-1,1);
    y = random(-1,1);
    
    // create the target function while creating points on the screen.
    float lineY = f(x);
    if(y > lineY){
      // all dots above the target line belongs to 1
      label = 1;
    }else {
      // all dots below the target line belongs to -1
      label = -1;
    }
  }
  
  Point(float x_, float y_){
    x = x_;
    y = y_;
  }
  
  // Map dots from leftTop as (0,0) to cartesian plane as (0,0) in the center of the plane.
  float pixelX(){
    return map(x, -1, 1, 0, width);
  }
  
  float pixelY(){
    return map(y, -1, 1, height, 0);
  }
  
  void show(){
    stroke(0);
    if(label == 1){
      fill(255);
    }else{
      fill(0);
    }
    
    float px = pixelX();
    float py = pixelY();
    ellipse(px,py,32,32);
  }
}
