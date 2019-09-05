Rotator[] rotators;
Object[] newArray = new Object[0];

int radius = 3;
int numPoints = 5;
float angle=TWO_PI/(float)numPoints;
float counter;

void recurseSetup(int setup) {
  while(setup > 0) {
    rotators = new Rotator[numPoints];
      for (int i = 0; i < rotators.length; i++) {
        rotators[i] = new Rotator(radius*cos(angle*i),radius*sin(angle*i));
       }
    newArray = (Object[]) append(newArray, rotators);
    radius = radius + 50;
    numPoints = int(TWO_PI*radius)/60;  //figure out math for this line
    angle=TWO_PI/(float)numPoints;
    setup--;
  };
};

void drawArray() {
  for(int i = 0; i < newArray.length; i++) {
    Rotator[] recurseRotator = (Rotator[]) newArray[i];
      for(int j = 0; j < recurseRotator.length; j++) {
        recurseRotator[j].update();
        recurseRotator[j].display(counter);
      }
  }
}

void setup() {
  size(1000, 1000);
  recurseSetup(12);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  drawArray();
  counter+=.00001;
}