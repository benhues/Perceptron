// The activation function
int sign(float n){
  if(n >= 0){
    return 1;
  }else {
    return -1;
  }
}

// This perceptrons with fixed two inputs.
class Perceptrons {
  float[] weights;
  float lr = 0.001;
  
  
  // Constructor
  Perceptrons(int n){
     weights = new float[n];
    // Initialize the weights randomly
    for(int i = 0; i< weights.length; i++){
      weights[i] = random(-1, 1);
    }
  }
  
  // put x, y, bias into the perceptron, after a activation function, resulting 1 or -1
  int guess(float[] inputs){
    float sum = 0;
    for(int i = 0; i < weights.length; i++){
      sum += inputs[i]*weights[i];
    }
    int output = sign(sum);
    return output;
  }
  
  // Target comes from the label which indicates the correct answer.
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error = target - guess;
    
    // Tune all the weights
    for(int i = 0; i < weights.length; i++){
      // Traverse x, y, bias.
      // if error is zero which means for this parameter correct answer,   then weights would not be budged.
      // if error is not zero which means for this parameter wrong answer, then weights would be changed.
      weights[i] += error * inputs[i] * lr;
    }
    
  }
  
  float guessY(float x){
    //float m = weights[0] / weights[1];
    //float b = weights[2];
    //return m * x + b;
    
    float w0 = weights[0]; // x
    float w1 = weights[1]; // y
    float w2 = weights[2]; // bias
    
    return -(w2 / w1) - (w0 / w1) * x;

  }
  
  

}
