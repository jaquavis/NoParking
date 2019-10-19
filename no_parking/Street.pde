class Street {
  String streetname;  // Local variables
  int streetwidth, y;

  Street(String a, int b, int c) { // Constructor: streetname, streetwidth, y
    streetname = a;
    streetwidth = b;
    y = c;
  }

  void drawStreet() { // function to draw streets
    stroke (0); // Setting the outline (stroke) to black
    fill (125);
    rect (0, y, width, streetwidth);
    fill (255);
    text (streetname, 350, y+streetwidth/2);
  }

  void drawlinkStreet() { // function to draw road sections connecting parking lot with streets
    fill(125);
    rect (lot.blockwidth+lot.x, lot.y-lot.stallwidth/2+5, lot.avewidth, (lot.street2.y+lot.street2.streetwidth)-(lot.y-lot.streetwidth/2)); // link road(top)
    rect (lot.blockwidth+lot.x, lot.y+lot.blocks*lot.blockheight+(lot.blocks-1)*lot.streetwidth+lot.streetwidth/2, lot.avewidth, lot.street1.y-lot.y-lot.blocks*lot.blockheight-(lot.blocks-1)*lot.avewidth-streetwidth/2); // link road(bottom)
    stroke (125);
    rect (lot.blockwidth+lot.x+1, lot.y-lot.stallwidth/2+5, lot.avewidth-2, (lot.street2.y+lot.street2.streetwidth)-(lot.y-lot.streetwidth/2)); // link road(background)(top)
    rect (lot.blockwidth+lot.x+1, lot.y+lot.blocks*lot.blockheight+(lot.blocks-1)*lot.streetwidth+lot.streetwidth/2, lot.avewidth-2, lot.street1.y-lot.y-lot.blocks*lot.blockheight-(lot.blocks-1)*lot.avewidth-streetwidth/2); // link road(background)(bottom)
    stroke(0);
  }
}