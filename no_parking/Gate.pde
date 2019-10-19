class Gate { //y increases in negative direction
  boolean open;  // boolean to store state of gate
  int gatewidth, gateheight, x, y, barsnumber;  // attributes of gate

  Gate(int a, int b) { // Constructor: x, y
    open=true;
    x=a;
    y=b;
    gateheight = 50;
    gatewidth = 10;
    barsnumber = 5;
  }

  void gateOpen() {  // function to open gate
    if (open==false) {  // if gate is closed
      int temp = gatewidth;   // switch width and height
      gatewidth = gateheight; //
      gateheight = temp;      //
    }
    open = true;  // set state to open
  }
  void gateClosed() {  // function to close gate
    if (open) {  // if gate is open
      int temp = gatewidth;   // switch width and height
      gatewidth = gateheight; //
      gateheight = temp;      //
    }
    open = false;  // set state to closed
  }

  void drawGate() {  // function to draw gate
    if (open==false) {  // draw closed gate
      for (int i=0, t=0; i<barsnumber; i++) {
        if (t==0) {  // draw stripes
          fill(#FF8103);
          t=1;
        } else if (t==1) {
          fill(#FFF703);
          t=0;
        }
        rect(x+(i*gatewidth/barsnumber), y, gatewidth/barsnumber, -1*gateheight);
      }
    }
    if (open) {  // draw open gate
      for (int i=0, t=0; i<barsnumber; i++) {
        if (t==0) {  // draw stripes
          fill(#FF8103);
          t=1;
        } else if (t==1) {
          fill(#FFF703);
          t=0;
        }
        rect(x, y+(-1*i*gateheight/barsnumber), gatewidth, -1*gateheight/barsnumber);
      }
    }
  }
}