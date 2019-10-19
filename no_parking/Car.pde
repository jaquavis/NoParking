class Car {  // loads images to display car
  final int SPEED;  // local variables
  int xpos, ypos, move;
  boolean turned, stopped;
  Parking_Stall stall;
  int number;

  Car(int k, int h, int l, int z) {  // Constructor: xpos, ypos, speed, number
    xpos=k;
    ypos=h;
    SPEED=l;
    turned=false;
    move=SPEED;
    number=z;
  }

  void moveCar() {  // function to move car
    if (turned==false) {
      xpos+=move;
    }
    if (turned) {
      ypos+=move;
    }
    if ((ypos<=lot.gate1.y+1)&&(ypos>=lot.gate1.y)) {
      enter();
    }
    if ((xpos<=lot.x+lot.blockwidth+7)&&(xpos>=lot.x+lot.blockwidth+6)) {  // turn 1
      if (lot.gate1.open) {
        if ((int)random(0, 0)==0) {
          turned=true;
        }
      }
    }
    if ((ypos<=lot.street1.y+2)&&(ypos>=lot.street1.y)&&(turned)) {  // turn 2
      turned=false;
    }
    if (xpos>=width) {
      stopped=true;
    }
    drawCar();
  }

  void drawCar() {  // function to draw car
    if (stopped==false) {
      if (turned==false) {
        image(BRZ, xpos, ypos+6, 3.20/1.28*lot.street2.streetwidth/1.5, lot.street2.streetwidth/1.5);
      }
      if (turned) {
        image(BRZ_turned, xpos, ypos+6, lot.street2.streetwidth/1.5, 3.20/1.28*lot.street2.streetwidth/1.5);
      }
    }
  }

  void enter() {  // function for car entry
    stopped=true;
    move=0;
    ypos=lot.gate2.y-BRZ.height/2;
    xpos=lot.x+lot.blockwidth+6;
    lot.occupyRandom(number);  // passing car number
    println(lot.marijke[0].stall.blockrow);
    println(lot.marijke[0].stall.blockcol);
    println(lot.marijke[0].stall.stallrow);
    println(lot.marijke[0].stall.stallcol);
  }

  void exit() {  // function for car exit
    stopped=false;
    move=SPEED;
    lot.unnoccupyAt(stall);
  }
}