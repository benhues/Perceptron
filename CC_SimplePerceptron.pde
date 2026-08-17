Perceptrons brain;

Point[] points = new Point[100];

int trainingIndex = 0;

void setup(){
  size(800,800);
  // initialize a single perceptron
  brain = new Perceptrons(3);
  
  // initialize 100 dots on the screen
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
  
}

void draw(){
  background(255);
  stroke(0);
  //line(0,height,width,0);
  
  // Target dots with start point and end point which constitute the target line.
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  // agent to simulate the target line.
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
  
  // show all the points
  for(Point pt : points){
    pt.show();
  }
  
  // initialize all dots, if dots are guessed with 1, which means above the line, filled with green color.
  // if dot are guessed with -1, which means below the line, filled with the red color.
  for(Point pt : points){
    // Get all the inputs with x, y, bias parameters.
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if(guess == target){
      fill(0,255,0);
    }else {
      fill(255,0,0);
    }
     noStroke();
     ellipse(pt.pixelX(), pt.pixelY(), 16, 16);
    
  }
  
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if(trainingIndex == points.length){
    trainingIndex = 0;
  }
}
