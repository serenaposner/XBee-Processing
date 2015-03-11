

//Processing Code:

import processing.serial.*;
Serial myPort;

int[] values;

int numOfSensors = 2;
int circleGrow;

void setup () {
  size (500,500);
  myPort = new Serial (this, Serial.list()[5], 9600);
  myPort.bufferUntil('\n'); // Read until the End of Line
  background(0);
}
void draw () {
background(0);
//println(circleGrow);
fill (255);
float bigger= map(circleGrow, 0,50,1,200);
ellipse (250,250, bigger, bigger);
}
void serialEvent(Serial myPort) {
  
  // get the string from arduino
  String inString = myPort.readStringUntil('\n'); 
//    println(inString);

  //    println(inString);
  if (inString != null) {
    // trim off any whitespace 
    inString = trim(inString);
    // split the string
    values = int(split(inString,","));

    if (values.length >= numOfSensors) {
      circleGrow = values[1]; // Once the switch has been flipped
      println(circleGrow);

    }
  }
}
