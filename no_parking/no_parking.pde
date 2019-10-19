/*cars still overlapping
make cars exit
control panel
unoccupyAt
*/

Date date = new Date();  // Create Date
Parking_Lot lot = new Parking_Lot (3, 40, 40, 2, 5, 50, 70, 170, 250); //blocks, avewidth, streetwidth, row, col, stallwidth, stallheight, x, y
Price_Calculator priceCalculator= new Price_Calculator();  // Create price calculator
PImage BRZ, BRZ_turned;  // Declares images

void setup() {
  size(900, 900);
  lot.drawLot();
  BRZ = loadImage("BRZ.png");
  BRZ_turned = loadImage("BRZ_turned.png");
}

void draw() {
  date.addMinute();
  lot.updateOpenStalls();
  lot.checkGates();
  lot.drawLot();
  lot.moveCars();
}