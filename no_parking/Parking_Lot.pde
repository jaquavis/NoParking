class Parking_Lot { // origin is at start of first section
  Parking_Section [][] sections; // 2d array of parking sections
  final int TOTALSTALLS; // declaring final variable number of stalls
  int blocks, avewidth, streetwidth, row, col, stallwidth, stallheight, x, y, openstalls; // declaring local integer variables
  int blockwidth, blockheight; // declaring local boolean variables
  Gate gate1; // top gate
  Gate gate2; // bottom gate
  Street street1;// lower big road
  Street street2; // Upper big road
  bars sign1;  // top sign
  bars sign2;  // bottom sign
  Car [] marijke;  // declaring array of Cars

  Parking_Lot(int a, int b, int c, int d, int e, int f, int g, int h, int i) {  // Constructor: blocks, avewidth, streetwidth, row, col, stallwidth, stallheight, x, y
    blocks = a;
    avewidth = b;
    streetwidth = c;
    row = d;
    col = e;
    stallwidth = f;
    stallheight = g;
    x = h;
    y = i;
    blockwidth = col*stallwidth; // width of individual parking section
    blockheight = row*stallheight; // heigt o individual parking section
    sections = new Parking_Section [blocks][2];  // initializing parking section array
    for (int i2=0; i2<blocks; i2++) {  // double for loop to construct parking section array
      for (int j=0; j<2; j++) {        //
        sections [i2][j] = new Parking_Section(row, col, stallwidth, stallheight, x+(j*(blockwidth+avewidth)), y, i2, j);
      }
      x=h;  // resetting value of x
      y+=blockheight+streetwidth;  // increasing y with each iteration
    }
    y=i; // reseting value of y
    gate1 = new Gate (x+(blockwidth), y-streetwidth/2+10);  // top gate
    gate2 = new Gate (x+(blockwidth), y+(blockheight*blocks)+((blocks-1))*streetwidth+streetwidth/2);  // bottom gate
    TOTALSTALLS=row*col*blocks*2; // final total number of stalls
    openstalls=TOTALSTALLS; // number of open stalls initially
    street1 = new Street ("South City Street", 40, 810);// lower big road
    street2 = new Street ("North City Street", 40, 150); // Upper big road
    sign1 = new bars("ENTRANCE", "SPACES:", 300, 195, 100, 50); // top sign
    sign2 = new bars("EXIT", "Fee=", 300, 755, 100, 50); // bottom sign
    marijke = new Car [1];  // initializing array of Cars
    for (int k=0; k<marijke.length; k++) {  // for loop to construct Cars array
      marijke [k] = new Car(-150*k, 150, 2, k);  // xpos, ypos, speed, number
    }
  }

  void drawLot() {  // function to draw parking lot
    background(69, 145, 74);  // draw background
    fill(125);  // fill grey
    rect(x-(streetwidth/2), y-(avewidth/2), (blockwidth*2)+(avewidth*2), (blockheight*(blocks))+(avewidth*blocks));
    for (int i=0; i<blocks; i++) {  // double for loop to draw parking sections
      for (int j=0; j<2; j++) {    //
        sections[i][j].drawSection();
      }
    }
    street1.drawStreet();
    street2.drawStreet();
    street1.drawlinkStreet();
    gate1.drawGate();
    gate2.drawGate();
    sign1.makebars(openstalls);
    sign2.makebars(priceCalculator.totalprice);
  }

  void updateOpenStalls() {  // function to update rumber of open stalls with each iteration
    int temp=TOTALSTALLS;
    int change=0;
    for (int i=0; i<blocks; i++) {
      for (int j=0; j<2; j++) {
        for (int k=0; k<row; k++) {
          for (int l=0; l<col; l++) {
            if (sections[i][j].stalls[k][l].occupied) {
              temp--;
            }
          }
        }
      }
    }
    change = openstalls-temp;
    openstalls=openstalls-change;
  } 

  void occupyRandom(int n) {  // function to randomly occupy stall from lot
    boolean yet=true;  // boolean to store if unnoccupied stall is found
    int i, j, k, l;
    if (openstalls!=0) {  // don't run loop if all stalls are occupied to prevent infinite loop
      do {
        i = (int)random(0, blocks);  // pick random stall
        j = (int)random(0, 2);       //
        k = (int)random(0, row);     //
        l = (int)random(0, col);     //
        if (lot.sections[i][j].stalls[k][l].occupied==false) {  // if stall is unnoccupied
          lot.sections[i][j].stalls[k][l].occupied=true;  // set stall to occupied
          yet=false;
        }
      } while (yet);  // repeat loop untill unnoccupied stall is found
      lot.sections[i][j].stalls[k][l].timeTaken = new Date (date);  // set new time taken
      lot.sections[i][j].stalls[k][l].timeLeft = null;  // void previous time left
      marijke[n].stall=lot.sections[i][j].stalls[k][l];  // storing occupied stall value in car
    }
  }

  void unnoccupyRandom() {  // function to randomly unnoccupy stall from lot
    boolean yet=true;  // boolean to store if occupied stall is found
    int i, j, k, l;
    if (openstalls!=TOTALSTALLS) {  // don't run loop if all stalls are unnoccupied to prevent infinite loop
      do {
        i = (int)random(0, blocks);  // pick random stall
        j = (int)random(0, 2);       //
        k = (int)random(0, row);     //
        l = (int)random(0, col);     //
        if (lot.sections[i][j].stalls[k][l].occupied) {  // if stall is occupied
          lot.sections[i][j].stalls[k][l].occupied=false;  // set stall to unnoccupied
          yet=false;
        }
      } while (yet);  // repeat loop untill occupied stall is found
      lot.sections[i][j].stalls[k][l].timeLeft = new Date (date);  // set new time left
      lot.sections[i][j].stalls[k][l].price= priceCalculator.PriceCalc(i, j, k, l);  // calculate price of stall
      lot.sections[i][j].stalls[k][l].timeTaken = null;  // void previous time taken
      lot.sections[i][j].stalls[k][l].timeLeft = null;  // void previous time left
    }
  }

  void unnoccupyAt(Parking_Stall a) {
    
    
  }

  void checkGates() {  // function to check wether gates should be opened or closed
    if (openstalls==0) {  // if lot is full
      lot.gate1.gateClosed();  // cose gates
      lot.gate2.gateClosed();  //
    }
    if (openstalls!=0) {  // if lot is not full
      lot.gate1.gateOpen();  // open gates
      lot.gate2.gateOpen();  // open gates
    }
  }

  void moveCars() {  // function to move all cars in array
    for (int i=0; i<marijke.length; i++) {
      marijke[i].moveCar();
    }
  }
}