
float[][] z = new float[2][1];
Float colorNumber = 100.0;
float plantScale = 1.0/11.0;

void setup() {
  size(500,500);
  background(255);
  z[0][0] = 0.0;
  z[1][0] = 0.0; 
  colorMode(HSB, 100);
}

void draw() {
  stroke(100,100,100);
  translate(width/2, height);
  scale(height*plantScale,-height*plantScale);
  strokeWeight(1/(height*plantScale));

  for(int i = 0; i < 4000; i++){
    
    float r = random(1);
    // 1% of the time, apply this transformation
    if(r < 0.01){
      float[][] mat01 = {{0.0,0.0},{0.0,0.16}};
      z = matrixMult(mat01,z);
      
    stroke(colorNumber,100,100);
      
    }

     // 85% of the time, apply this transformation
    else if (r < .86){ 
      float[][] mat86 = {{0.85,0.04},{-0.04,0.85}};
      z = matrixMult(mat86,z);
      z[1][0] += 1.6;
    }
    
    // 7% of the time, apply this transformation
    else if (r < .93){
      float[][] mat93 = {{.02,-0.26},{0.23,0.22}};
      z = matrixMult(mat93,z);
      z[1][0] += 1.6;
    }
    
    else{
      float[][] mat100 = {{-0.15,0.28},{0.26,0.24}};
      z = matrixMult(mat100,z);
      z[1][0] += 0.44;
    }
     
    colorNumber = random(100);
     point(z[0][0],z[1][0]);
  }
  
 
}

float[][] matrixMult(float[][] mat1, float[][] mat2) {
  // New matrix
  float[][] newMatrix;
  // Make sure the matricies are of correct dimmension
  if (mat1[0].length != mat2.length)
    throw new RuntimeException("Matrices are of incorrect dimmension.");
  else
    newMatrix = new float[mat1.length][mat2[0].length];

  // Populate the matrix
  // Cycle through each row of the 
  for (int row = 0; row < mat1.length; row++) {
    for (int col = 0; col < mat2[0].length; col++) {
      // The value of the dot products
      float value = 0.0;
      for (int ele = 0; ele < mat2.length; ele++) {
        value += mat1[row][ele] * mat2[ele][col];
      }
      newMatrix[row][col] = value;
    }
  }
  return newMatrix;
}
