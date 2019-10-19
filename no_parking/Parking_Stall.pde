class Parking_Stall {  // origin is at top left corner
  boolean occupied;          // Stall attributes
  Date timeTaken, timeLeft;
  float price;
  float stallWidth, stallHeight, posX, posY;  // Dimension and position
  int blockrow, blockcol, stallrow, stallcol;

  Parking_Stall(float x, float y, float w, float h, int aa, int bb, int cc, int dd) { // Constructor: posX, posY, stallWidth, stallHeight
    occupied = false;
    posX = x;
    posY = y;
    stallWidth = w;
    stallHeight = h;
    timeTaken = null;
    timeLeft = null;
    blockrow=aa;
    blockcol=bb;
    stallrow=cc;
    stallcol=dd;
  }

  void drawStall() {  // function to draw parking stall
    if (occupied)
      fill(color(255, 90, 71)); // RED STALL
    else
      fill(color(152, 251, 152));  // GREEN STALL
    strokeWeight(2);
    stroke(255);
    rect(posX, posY, stallWidth, stallHeight);
    strokeWeight(1);
  }

  void setStatus(boolean status, Date time)// Sets whether the stall is occupied or not
  {
    occupied = status;
    if (occupied) {
      timeTaken = new Date(time);
    }
  }
}