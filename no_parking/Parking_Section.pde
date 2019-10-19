class Parking_Section {  // origin is at top left stall
  Parking_Stall [][] stalls; // 2d array of parking lots
  int row, col, stallwidth, stallheight, x, y; // declaring local integer variables

  Parking_Section(int a, int b, int c, int d, int e, int f, int g, int h) { // Constructor: row, col, stallwidth, stallheight, x, y, blockrow, blockcol
    row = a;
    col = b;
    stallwidth = c;
    stallheight = d;
    x = e;
    y = f;
    stalls = new Parking_Stall [row][col];  // Initializing parking stall array
    for (int i=0; i<row; i++) {    // double for loop to construct parking stall array
      for (int j=0; j<col; j++) {  //
        stalls[i][j] = new Parking_Stall(x+(j*stallwidth), y, stallwidth, stallheight, g, h, i, j);
      }
      x=e;  // resetting value of x
      y+=stallheight; // increasing y value with each iteration
    }
    y=f;  // resetting vaue of y
  }

  void drawSection() {  // function to draw parking sections
    for (int i=0; i<row; i++) {    // double for loop to draw parking stalls
      for (int j=0; j<col; j++) {  //
        stalls[i][j].drawStall();
      }
    }
  }
}